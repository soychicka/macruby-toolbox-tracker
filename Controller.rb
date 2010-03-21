class Controller
  attr_writer :friendsTableView

  def awakeFromNib
    @friends = []
    @friendsTableView.dataSource = self
  end

  def numberOfRowsInTableView(view)
    @friends.size
  end

  def tableView(view, objectValueForTableColumn:column, row:index)
	@index = index
	f = @friends[index]
    case column.identifier
      when 'first_name'
        f.first_name
      when 'last_name'
        f.last_name
    end
  end

  def tableView(view, setObjectValue:object, forTableColumn:column, row:index)
    f = @friends[index]
    case column.identifier
      when 'first_name'
        f.first_name = object
      when 'last_name'
        f.last_name = object
    end
  end

  def addFriend(sender)
    f = Friend.new
    f.first_name = 'John'
    f.last_name = 'Smith'
    @friends << f
    @friendsTableView.reloadData
  end

  def deleteFriend(sender)
	@friends.delete(@friends[@index])
	@friendsTableView.reloadData
	
  end

end