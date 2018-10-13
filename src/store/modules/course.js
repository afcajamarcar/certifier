import * as constants from '@/store/constants'
import CourseContract from '@/contracts/Certifier.json'

const state = {
  provider: !!(window.web3 && window.web3.currentProvider),
  isOwner: false,
  contract: null,
  coinbase: null
}

const actions = {
  [constants.COURSE_INIT]: ({commit}) => {
    const abi = CourseContract.abi
    const contractAddress = '0x54adadc46bd2de0b1659dd0e420e687028d910ba' //Address can be fined on Certifier.address
    let contract = web3.eth.contract(abi).at(contractAddress)
    commit(constants.COURSE_SET_PROPERTY, {contract})
    web3.eth.getCoinbase((error, coinbase) => {
      if (error) console.error(error)
      commit(constants.COURSE_SET_PROPERTY, {coinbase})
      contract.isOwner({from: coinbase}, (error, isOwner) => {
        if(error) console.error(error)
        commit(constants.COURSE_SET_PROPERTY, {isOwner})
      })
    })
  },
  [constants.COURSE_ADD_COURSE]: ({state}, data) => {
    const {
      courseCode,
      courseName,
      courseCost,
      courseDuration,
      courseThreshold,
      codes
    } = data
    state.contract.addCourse(
      courseCode,
      courseName,
      courseCost,
      courseDuration,
      courseThreshold,
      codes,
      {from: state.coinbase},
      (error, result) => {
        if (error) console.error(error)
        console.info(result)
      }
    )
  }
}

const mutations = {
  [constants.COURSE_SET_PROPERTY]: (state, data) => {
    const [k, v] = Object.entries(data)[0]
    state[k] = v
  }
}

const getters = {

}

export default {
  state,
  actions,
  mutations,
  getters
}