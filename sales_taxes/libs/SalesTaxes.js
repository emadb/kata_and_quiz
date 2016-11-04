const SalesTaxes = function() { }

  function basicTaxedItem(item){
    const basicSaleTax = 0.10

    const taxMap = {
    'music CD': basicSaleTax,
    'bottle of perfume': basicSaleTax
  } 

  function calculateBasicTax(item){
    const tax = taxMap[item.type] || 0
    return item.price * tax
  } 

  function calculateImportTax(item){
    const importedTax = item.imported? 0.05 : 0
    return (item.price * importedTax)
  }

  return {
    total : function(){
      return item.price + this.salesTaxes()
    },
    salesTaxes : function(){
      return calculateBasicTax(item) + calculateImportTax(item)
    }
    
  }
}





function round(num){
  return Math.ceil(num * 100) / 100
  //return (Math.ceil(num*20)/20).toFixed(2)
  //return (Math.ceil(num*20 - 0.05)/20).toFixed(2)
}



SalesTaxes.prototype.foo = function(){
  return true 
}

SalesTaxes.prototype.receipt = function(items){

  const result = items.reduce((acc, curr) => {
    const trasformedItem = basicTaxedItem(curr)
    acc.total = acc.total + trasformedItem.total() 
    acc.salesTaxes = acc.salesTaxes + trasformedItem.salesTaxes()
    return acc
  }, {
    total: 0, 
    salesTaxes: 0
  })

  return {total: round(result.total), salesTaxes: round(result.salesTaxes)}

}


module.exports = SalesTaxes

