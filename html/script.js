const Config = {
  inventory: "qb-inventory", // Change this to your inventory resource name
};

$(function () {
  function display(bool) {
    if (bool) {
      $("#container").show();
    } else {
      $("#container").hide();
    }
  }

  display(false);

  window.addEventListener("message", async function (event) {
    var item = event.data;
    if (item.type === "ui") {
      if (item.status == true && item.table != null) {
        display(true);
        loadCraftingTable(item.table);
      } else {
        display(false);
      }
    }
  });
  // if the person uses the escape key, it will exit the resource
  document.onkeyup = function (data) {
    if (data.which == 27) {
      $.post("https://qw-crafting/exit", JSON.stringify({}));
      return;
    }
  };
});

function craftItem(event) {
  const buttonClicked = event.target;
  const parent = buttonClicked.parentElement.parentElement;
  const item = parent.querySelector("#craftable-item").dataset.item;
  const location = parent.querySelector("#craftable-item").dataset.location;
  

  $.post(
    "https://qw-crafting/craft",
    JSON.stringify({
      item: item,
      location: location,
    })
  );
}

async function loadCraftingTable(tableName) {
  const response = await fetch("https://qw-crafting/items", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      location: tableName,
    }),
  });

  const data = await response.json();

  const itemsContainer = document.getElementById("items");
  itemsContainer.innerHTML = "";
  data.forEach((item) => {
    const itemElement = document.createElement("div");
    const classList = ["p-3", "bg-gray-700", "w-full", "hover:cursor-pointer"];
    itemElement.classList.add(...classList);
    itemElement.innerHTML = `
                      <div class="flex items-start justify-between itemContainer"> 
                        <div id="craftable-item" data-location="${item.location}" data-item="${
                          item.item
                        }" class="w-32 h-32 bg-gray-600  flex items-center justify-center relative hover:bg-gray-700">
                          <div class="text-sm text-white absolute top-1 left-2 line-clamp-1">${
                            item.name
                          }</div>
                            <img class="w-16 h-16" src='nui://${
                              item.image
                            }' alt="">
                            <div class="text-sm absolute bottom-1 right-2 text-white ">${item.itemWeight.toString()}</div>
                            <div class="text-sm absolute bottom-1 left-2 text-white ">${item.craftableAmount.toString()}x</div>
                        </div>
                        <div id="requiredItems" class="flex flex-col items-start w-full gap-1 flex-1 pl-4">
                
                        </div>
                      </div>
                    `;
    let craftItemButton = itemElement.querySelector("#requiredItems");
    craftItemButton.addEventListener("click", craftItem);
    itemsContainer.appendChild(itemElement);

    const requiredItemsContainer = itemElement.querySelector("#requiredItems");

    item.itemsNeededToCraft.forEach((requiredItem) => {
      const requiredItemElement = document.createElement("div");
      const classList = ["flex", "items-center", "justify-between"];
      requiredItemElement.classList.add(...classList);
      requiredItemElement.innerHTML = `
                      <div class="flex gap-2">
                          <img class="w-6 h-6" src='nui://${
                            Config.inventory
                          }/html/images/${requiredItem.item}.png' alt="">
                          <div class="text-sm text-white ">${
                            requiredItem.item
                          }: ${requiredItem.amount.toString()}</div>
                      </div>
                    `;
                    let craftItemButton = itemElement.querySelector("#craftable-item");
                    craftItemButton.addEventListener("click", craftItem);
      requiredItemsContainer.appendChild(requiredItemElement);
    });
  });
}
