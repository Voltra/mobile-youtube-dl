import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:super_enum/super_enum.dart';

import 'event.dart';
import 'state.dart';

@lazySingleton
class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc() : super(DownloadState.initial());

  @override
  Stream<DownloadState> mapEventToState(
    DownloadEvent event,
  ) /* async* */ {
    return event.when(
      doneEvent: _onDone,
      errorEvent: _onError,
      loadingEvent: _onLoading,
      inputUrl: _onUrl,
      pickFolder: _onFolderPick,
    );
  }

  Stream<DownloadState> _onFolderPick(e) async* {
    yield DownloadState.directoryChosen();
  }

  Stream<DownloadState> _onUrl(e) async* {
    yield DownloadState.urlFed();
  }

  Stream<DownloadState> _onLoading(e) async* {
    yield DownloadState.loadingState();
  }

  Stream<DownloadState> _onError(e) async* {
    yield DownloadState.errorState();
  }

  Stream<DownloadState> _onDone(_) async* {
    yield DownloadState.doneState();
  }
}
