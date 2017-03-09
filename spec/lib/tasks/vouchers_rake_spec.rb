# frozen_string_literal: true
require 'spec_helper'

describe 'vouchers:check_expiring_soon' do
  include_context 'rake'

  let(:expiring_soon_checker) { double }

  before do
    ExpiringSoonChecker.stub(:new) { expiring_soon_checker }
  end

  it(:prerequisites) { should include('environment') }

  it 'checks vouchers expiring soon' do
    expiring_soon_checker.should_receive(:check)
    subject.invoke
  end
end
