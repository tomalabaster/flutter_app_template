abstract class MasterScreenEvent {}

class MasterScreenEventSwitchTab extends MasterScreenEvent {
  final int tabIndex;

  MasterScreenEventSwitchTab({this.tabIndex});
}
