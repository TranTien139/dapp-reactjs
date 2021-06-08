import rootReducer from '../reducers';
import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';

const index = createStore(rootReducer, applyMiddleware(thunk));
export default index;
