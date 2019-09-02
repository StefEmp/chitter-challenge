
feature 'chitter manager' do
  scenario 'Can manage peeps' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end
end
feature 'view posts' do
    scenario 'can view posts' do
      Peep.create(post: 'I am alive')
      visit('/posts')
      expect(page).to have_content "I am alive"
    end
end

feature 'Adding a new peep' do
  scenario 'A user can add a peep' do
    visit('/posts/new')
    fill_in('post', with: 'I like writing generic text')
    click_button('Submit')
    expect(page).to have_content 'I like writing generic text'
  end
end