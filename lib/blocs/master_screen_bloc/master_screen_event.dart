abstract class MasterScreenEvent {}

class MasterScreenEventSwitchTab extends MasterScreenEvent {
  final int tabIndex;
  final int subTabIndex;

  MasterScreenEventSwitchTab({this.tabIndex, this.subTabIndex});
}
