import { mount } from '@vue/test-utils'
import Sample from 'packs/components/sample';

describe('Sample', () => {
  const wrapper = mount(Sample)

  it('is a Vue instance', () => {
    expect(wrapper.isVueInstance()).toBeTruthy()
  })

  it('renders the correct markup', () => {
    expect(wrapper.html()).toContain('<p>sample component</p>')
  })
})
