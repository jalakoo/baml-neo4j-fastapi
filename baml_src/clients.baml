client<llm> SambaNova {
  provider openai-generic
  options {
    base_url "https://api.sambanova.ai/v1"
    model env.SAMBANOVA_LLM_MODEL
    api_key env.SAMBANOVA_API_KEY
  }
}


client<llm> GPT4 {
  provider openai
  options {
    model gpt-4
    api_key env.OPENAI_API_KEY
  }
}

client<llm> GPT4Turbo {
  provider openai
  options {
    model gpt-4-turbo
    api_key env.OPENAI_API_KEY
  }
}

client<llm> GPT4o {
  provider openai
  options {
    model gpt-4o
    api_key env.OPENAI_API_KEY
  }
}


client<llm> GPT3 {
  provider baml-openai-chat
  options {
    model gpt-3.5-turbo
    api_key env.OPENAI_API_KEY
  }
}   