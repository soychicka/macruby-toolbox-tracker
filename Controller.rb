class Controller
  attr_writer :toolsTableView

  def awakeFromNib
    @tools = []
    @toolsTableView.dataSource = self
  end

  def numberOfRowsInTableView(view)
    @tools.size
  end

  def tableView(view, objectValueForTableColumn:column, row:index)
	@index = index
	f = @tools[index]
    case column.identifier
      when 'manufacturer'
        f.manufacturer
      when 'tool'
        f.tool
      when 'location'
        f.location
    end
  end

  def tableView(view, setObjectValue:object, forTableColumn:column, row:index)
    f = @tools[index]
    case column.identifier
      when 'manufacturer'
        f.manufacturer = object
      when 'tool'
        f.tool = object
      when 'location'
        f.location = object
    end
  end

  def addTool(sender)
    f = Tool.new
    f.manufacturer = ''
    f.tool = ''
	f.location = 'closet'
    @tools<< f
    @toolsTableView.reloadData
  end

  def deleteTool(sender)

	@tools.delete(@tools[@index])	if @index
	@toolsTableView.reloadData
	
  end

end