Category.destroy_all
Category.seed(:id,
  { id: 1, name: 'Pizza' },
  { id: 2, name: 'Antipasti' },
  { id: 3, name: 'Dessert' },
  { id: 4, name: 'Red Wine' },
  { id: 5, name: 'White Wine' },
  { id: 6, name: 'Other' },
  { id: 7, name: 'Coffee & Soft Drink' }
)