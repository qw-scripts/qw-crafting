const Config = {
  inventory: "qb-inventory", // Change this to your inventory resource name
};

const $incButton = $("#inc-button");
const $decButton = $("#dec-button");
const $counter = $("#counter");

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

        $incButton.click(function () {
          $counter.val(parseInt($counter.val()) + 1); // `parseInt` converts the `value` from a string to a number
          $counter.change();
        });

        $decButton.click(function () {
          if (parseInt($counter.val()) === 1) return;
          $counter.val(parseInt($counter.val()) - 1); // `parseInt` converts the `value` from a string to a number
          $counter.change();
        });
      } else {
        display(false);

        $incButton.off("click");
        $decButton.off("click");
      }
    }
  });
  // if the person uses the escape key, it will exit the resource
  document.onkeyup = function (data) {
    if (data.which == 27) {
      $.post("https://qw-crafting/exit", JSON.stringify({}));
      $counter.val(1);
      $incButton.off("click");
      $decButton.off("click");
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
      amount: parseInt($counter.val()),
    })
  );

  $counter.val(1);
  $incButton.off("click");
  $decButton.off("click");
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
    const classList = ["p-3", "bg-gray-700", "h-[150px]"];
    itemElement.classList.add(...classList);
    itemElement.innerHTML = `
                      <div class="flex items-start justify-between"> 
                        <div id="craftable-item" data-location="${
                          item.location
                        }" data-item="${
      item.item
    }" class="w-32 h-32 bg-gray-600 border border-gray-500 flex items-center justify-center relative hover:cursor-pointer hover:bg-gray-800">
                          <div class="text-sm text-white absolute top-1 left-2 line-clamp-1">${
                            item.name
                          }</div>
                            <img class="w-16 h-16" src='nui://${
                              item.image
                            }' alt="">
                            <div class="text-sm absolute bottom-1 right-2 text-white" id='current-weight'>${item.itemWeight.toString()}</div>
                            <div class="text-sm absolute bottom-1 left-2 text-white" id='current-amount' data-baseamount="${item.craftableAmount}">${item.craftableAmount.toString()}x
                            </div>
                        </div>
                        <div id="requiredItems" class="flex flex-col items-start w-full gap-1 flex-1 pl-4">
                
                        </div>
                      </div>
                    `;
    let craftItemButton = itemElement.querySelector("#craftable-item");
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
                          <div class="text-sm text-white" id='material-count' data-baseweight="${
                            requiredItem.amount
                          }">${requiredItem.item}: ${
        requiredItem.amount.toString() * parseInt($counter.val())
      }</div>
                      </div>
                    `;
      requiredItemsContainer.appendChild(requiredItemElement);
    });
  });
}

// update the weight and amount of the item when the counter is changed
$counter.change(function () {
  const materialCounts = document.querySelectorAll("#material-count");
  const currentAmounts = document.querySelectorAll("#current-amount");

  materialCounts.forEach((materialCount) => {
    const baseAmount = parseInt(materialCount.dataset.baseweight);
    const nextAmount = baseAmount * parseInt($counter.val());
    materialCount.textContent = `${
      materialCount.textContent.split(": ")[0]
    }: ${nextAmount}`;
  });

  currentAmounts.forEach((currentAmount) => {
    const baseAmount = parseInt(currentAmount.dataset.baseamount);
    const nextAmount = baseAmount * parseInt($counter.val());
    currentAmount.textContent = `${nextAmount}x`;
  });
});
