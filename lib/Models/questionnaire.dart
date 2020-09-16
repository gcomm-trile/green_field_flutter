class QuestionaireStructureRoot {
  String status;
  List<Structure> structure;
  List<Logic> logic;
  List<Filter> filter;
  Survey survey;
  List<Hanhchanh> hanhchanh;

  QuestionaireStructureRoot(
      {this.status,
      this.structure,
      this.logic,
      this.filter,
      this.survey,
      this.hanhchanh});

  QuestionaireStructureRoot.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['structure'] != null) {
      structure = new List<Structure>();
      json['structure'].forEach((v) {
        structure.add(new Structure.fromJson(v));
      });
    }
    if (json['logic'] != null) {
      logic = new List<Logic>();
      json['logic'].forEach((v) {
        logic.add(new Logic.fromJson(v));
      });
    }
    if (json['filter'] != null) {
      filter = new List<Filter>();
      json['filter'].forEach((v) {
        filter.add(new Filter.fromJson(v));
      });
    }
    survey =
        json['survey'] != null ? new Survey.fromJson(json['survey']) : null;
    if (json['hanhchanh'] != null) {
      hanhchanh = new List<Hanhchanh>();
      json['hanhchanh'].forEach((v) {
        hanhchanh.add(new Hanhchanh.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.structure != null) {
      data['structure'] = this.structure.map((v) => v.toJson()).toList();
    }
    if (this.logic != null) {
      data['logic'] = this.logic.map((v) => v.toJson()).toList();
    }
    if (this.filter != null) {
      data['filter'] = this.filter.map((v) => v.toJson()).toList();
    }
    if (this.survey != null) {
      data['survey'] = this.survey.toJson();
    }
    if (this.hanhchanh != null) {
      data['hanhchanh'] = this.hanhchanh.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Structure {
  int questionTypeID;
  String questionCode;
  String questionNameHTMLText;
  List<Answer> answer;
  List<Topic> topic;
  String answerList;
  String topicList;
  bool constantSumRequireResponseToEachIndividualInputBox;
  bool constantSumAllowDecimal;
  bool constantSumIncludeTotalLabelAtBottom;
  double constantSumTotalLabel;
  String constantSumTotalValueExpression;
  int rankingNumberOfItemsToRankOption;
  int rankingNumberOfItemsToRankMin;
  int rankingNumberOfItemsToRankMax;
  double numberMaxValue;
  double numberMinValue;
  bool numberAllowDecimalAnswer;
  int multiChoiceMinChecks;
  int multiChoiceMaxChecks;
  String videoLink;
  bool isQualified;
  bool isDisQualified;
  int uploadFileFileType;
  int rateMaxValue;
  String questionNameHTMLTextFooter;
  int layoutSpanCount;
  int gridRowNumberOfRow2RepeatHeader;

  Structure(
      {this.questionTypeID,
      this.questionCode,
      this.questionNameHTMLText,
      this.answer,
      this.topic,
      this.answerList,
      this.topicList,
      this.constantSumRequireResponseToEachIndividualInputBox,
      this.constantSumAllowDecimal,
      this.constantSumIncludeTotalLabelAtBottom,
      this.constantSumTotalLabel,
      this.constantSumTotalValueExpression,
      this.rankingNumberOfItemsToRankOption,
      this.rankingNumberOfItemsToRankMin,
      this.rankingNumberOfItemsToRankMax,
      this.numberMaxValue,
      this.numberMinValue,
      this.numberAllowDecimalAnswer,
      this.multiChoiceMinChecks,
      this.multiChoiceMaxChecks,
      this.videoLink,
      this.isQualified,
      this.isDisQualified,
      this.uploadFileFileType,
      this.rateMaxValue,
      this.questionNameHTMLTextFooter,
      this.layoutSpanCount,
      this.gridRowNumberOfRow2RepeatHeader});

  Structure.fromJson(Map<String, dynamic> json) {
    questionTypeID = json['QuestionTypeID'];
    questionCode = json['QuestionCode'];
    questionNameHTMLText = json['QuestionNameHTMLText'];
    if (json['Answer'] != null) {
      answer = new List<Answer>();
      json['Answer'].forEach((v) {
        answer.add(new Answer.fromJson(v));
      });
    }
    if (json['Topic'] != null) {
      topic = new List<Topic>();
      json['Topic'].forEach((v) {
        topic.add(new Topic.fromJson(v));
      });
    }
    answerList = json['AnswerList'];
    topicList = json['TopicList'];
    constantSumRequireResponseToEachIndividualInputBox =
        json['ConstantSum_RequireResponseToEachIndividualInputBox'];
    constantSumAllowDecimal = json['ConstantSum_AllowDecimal'];
    constantSumIncludeTotalLabelAtBottom =
        json['ConstantSum_IncludeTotalLabelAtBottom'];
    constantSumTotalLabel = json['ConstantSum_TotalLabel'];
    constantSumTotalValueExpression = json['ConstantSum_TotalValueExpression'];
    rankingNumberOfItemsToRankOption =
        json['Ranking_NumberOfItemsToRank_Option'];
    rankingNumberOfItemsToRankMin = json['Ranking_NumberOfItemsToRank_Min'];
    rankingNumberOfItemsToRankMax = json['Ranking_NumberOfItemsToRank_Max'];
    numberMaxValue = json['Number_MaxValue'];
    numberMinValue = json['Number_MinValue'];
    numberAllowDecimalAnswer = json['Number_AllowDecimalAnswer'];
    multiChoiceMinChecks = json['MultiChoice_MinChecks'];
    multiChoiceMaxChecks = json['MultiChoice_MaxChecks'];
    videoLink = json['Video_Link'];
    isQualified = json['IsQualified'];
    isDisQualified = json['IsDisQualified'];
    uploadFileFileType = json['UploadFile_FileType'];
    rateMaxValue = json['Rate_MaxValue'];
    questionNameHTMLTextFooter = json['QuestionNameHTMLText_Footer'];
    layoutSpanCount = json['Layout_SpanCount'];
    gridRowNumberOfRow2RepeatHeader = json['GridRow_NumberOfRow2RepeatHeader'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QuestionTypeID'] = this.questionTypeID;
    data['QuestionCode'] = this.questionCode;
    data['QuestionNameHTMLText'] = this.questionNameHTMLText;
    if (this.answer != null) {
      data['Answer'] = this.answer.map((v) => v.toJson()).toList();
    }
    if (this.topic != null) {
      data['Topic'] = this.topic.map((v) => v.toJson()).toList();
    }
    data['AnswerList'] = this.answerList;
    data['TopicList'] = this.topicList;
    data['ConstantSum_RequireResponseToEachIndividualInputBox'] =
        this.constantSumRequireResponseToEachIndividualInputBox;
    data['ConstantSum_AllowDecimal'] = this.constantSumAllowDecimal;
    data['ConstantSum_IncludeTotalLabelAtBottom'] =
        this.constantSumIncludeTotalLabelAtBottom;
    data['ConstantSum_TotalLabel'] = this.constantSumTotalLabel;
    data['ConstantSum_TotalValueExpression'] =
        this.constantSumTotalValueExpression;
    data['Ranking_NumberOfItemsToRank_Option'] =
        this.rankingNumberOfItemsToRankOption;
    data['Ranking_NumberOfItemsToRank_Min'] =
        this.rankingNumberOfItemsToRankMin;
    data['Ranking_NumberOfItemsToRank_Max'] =
        this.rankingNumberOfItemsToRankMax;
    data['Number_MaxValue'] = this.numberMaxValue;
    data['Number_MinValue'] = this.numberMinValue;
    data['Number_AllowDecimalAnswer'] = this.numberAllowDecimalAnswer;
    data['MultiChoice_MinChecks'] = this.multiChoiceMinChecks;
    data['MultiChoice_MaxChecks'] = this.multiChoiceMaxChecks;
    data['Video_Link'] = this.videoLink;
    data['IsQualified'] = this.isQualified;
    data['IsDisQualified'] = this.isDisQualified;
    data['UploadFile_FileType'] = this.uploadFileFileType;
    data['Rate_MaxValue'] = this.rateMaxValue;
    data['QuestionNameHTMLText_Footer'] = this.questionNameHTMLTextFooter;
    data['Layout_SpanCount'] = this.layoutSpanCount;
    data['GridRow_NumberOfRow2RepeatHeader'] =
        this.gridRowNumberOfRow2RepeatHeader;
    return data;
  }
}

class Answer {
  String answerText;
  String answerTextLink;
  int answerIndex;
  String answerCoding;
  String answerReportImage;
  bool otherSpecify;
  String otherSpecifyInType;
  bool isSingleChoice;
  bool isRandom;
  String meanScore;
  String t2BorB2B;

  Answer(
      {this.answerText,
      this.answerTextLink,
      this.answerIndex,
      this.answerCoding,
      this.answerReportImage,
      this.otherSpecify,
      this.otherSpecifyInType,
      this.isSingleChoice,
      this.isRandom,
      this.meanScore,
      this.t2BorB2B});

  Answer.fromJson(Map<String, dynamic> json) {
    answerText = json['AnswerText'];
    answerTextLink = json['AnswerText_Link'];
    answerIndex = json['AnswerIndex'];
    answerCoding = json['AnswerCoding'];
    answerReportImage = json['AnswerReportImage'];
    otherSpecify = json['OtherSpecify'];
    otherSpecifyInType = json['OtherSpecify_InType'];
    isSingleChoice = json['IsSingleChoice'];
    isRandom = json['IsRandom'];
    meanScore = json['MeanScore'];
    t2BorB2B = json['T2BorB2B'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AnswerText'] = this.answerText;
    data['AnswerText_Link'] = this.answerTextLink;
    data['AnswerIndex'] = this.answerIndex;
    data['AnswerCoding'] = this.answerCoding;
    data['AnswerReportImage'] = this.answerReportImage;
    data['OtherSpecify'] = this.otherSpecify;
    data['OtherSpecify_InType'] = this.otherSpecifyInType;
    data['IsSingleChoice'] = this.isSingleChoice;
    data['IsRandom'] = this.isRandom;
    data['MeanScore'] = this.meanScore;
    data['T2BorB2B'] = this.t2BorB2B;
    return data;
  }
}

class Topic {
  String topicText;
  String topicTextLink;
  int topicIndex;
  int topicCoding;
  bool otherSpecify;
  String otherSpecifyInType;
  bool isRandom;
  String topicType;
  bool required;
  int minCheck;
  int maxCheck;

  Topic(
      {this.topicText,
      this.topicTextLink,
      this.topicIndex,
      this.topicCoding,
      this.otherSpecify,
      this.otherSpecifyInType,
      this.isRandom,
      this.topicType,
      this.required,
      this.minCheck,
      this.maxCheck});

  Topic.fromJson(Map<String, dynamic> json) {
    topicText = json['TopicText'];
    topicTextLink = json['TopicText_Link'];
    topicIndex = json['TopicIndex'];
    topicCoding = json['TopicCoding'];
    otherSpecify = json['OtherSpecify'];
    otherSpecifyInType = json['OtherSpecify_InType'];
    isRandom = json['IsRandom'];
    topicType = json['TopicType'];
    required = json['Required'];
    minCheck = json['MinCheck'];
    maxCheck = json['MaxCheck'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TopicText'] = this.topicText;
    data['TopicText_Link'] = this.topicTextLink;
    data['TopicIndex'] = this.topicIndex;
    data['TopicCoding'] = this.topicCoding;
    data['OtherSpecify'] = this.otherSpecify;
    data['OtherSpecify_InType'] = this.otherSpecifyInType;
    data['IsRandom'] = this.isRandom;
    data['TopicType'] = this.topicType;
    data['Required'] = this.required;
    data['MinCheck'] = this.minCheck;
    data['MaxCheck'] = this.maxCheck;
    return data;
  }
}

class Logic {
  String fromPage;
  String skipType;
  String skipLogic;
  String skipToPage;
  String comments;

  Logic(
      {this.fromPage,
      this.skipType,
      this.skipLogic,
      this.skipToPage,
      this.comments});

  Logic.fromJson(Map<String, dynamic> json) {
    fromPage = json['FromPage'];
    skipType = json['SkipType'];
    skipLogic = json['SkipLogic'];
    skipToPage = json['SkipToPage'];
    comments = json['Comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FromPage'] = this.fromPage;
    data['SkipType'] = this.skipType;
    data['SkipLogic'] = this.skipLogic;
    data['SkipToPage'] = this.skipToPage;
    data['Comments'] = this.comments;
    return data;
  }
}

class Filter {
  String variableName;
  String filterCondition;

  Filter({this.variableName, this.filterCondition});

  Filter.fromJson(Map<String, dynamic> json) {
    variableName = json['VariableName'];
    filterCondition = json['FilterCondition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VariableName'] = this.variableName;
    data['FilterCondition'] = this.filterCondition;
    return data;
  }
}

class Survey {
  int version;
  bool isShowBackButton;

  Survey({this.version, this.isShowBackButton});

  Survey.fromJson(Map<String, dynamic> json) {
    version = json['Version'];
    isShowBackButton = json['IsShowBackButton'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Version'] = this.version;
    data['IsShowBackButton'] = this.isShowBackButton;
    return data;
  }
}

class Hanhchanh {
  String ward;
  String district;
  String city;

  Hanhchanh({this.ward, this.district, this.city});

  Hanhchanh.fromJson(Map<String, dynamic> json) {
    ward = json['Ward'];
    district = json['District'];
    city = json['City'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Ward'] = this.ward;
    data['District'] = this.district;
    data['City'] = this.city;
    return data;
  }
}
