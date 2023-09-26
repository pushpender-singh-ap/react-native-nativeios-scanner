import type {TurboModule} from 'react-native';
import {TurboModuleRegistry} from 'react-native';

export interface Spec extends TurboModule {
  scanner(): void;
}

export default TurboModuleRegistry.get<Spec>(
  'ReactNativeNativeIOSScanner',
) as Spec | null;
