ENTRY_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'entry' },
    attributes: {
      type: :object,
      properties: {
        concept: { type: :string, example: 'Some concept' },
        video_data: { type: :string, example: 'Some video_data', 'x-nullable': true },
        created_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
        updated_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true }
      },
      required: [
        :concept
      ]
    }
  },
  required: [
    :id,
    :type,
    :attributes
  ]
}

ENTRIES_COLLECTION_SCHEMA = {
  type: "object",
  properties: {
    data: {
      type: "array",
      items: { "$ref" => "#/definitions/entry" }
    }
  },
  required: [
    :data
  ]
}

ENTRY_RESOURCE_SCHEMA = {
  type: "object",
  properties: {
    data: { "$ref" => "#/definitions/entry" }
  },
  required: [
    :data
  ]
}
