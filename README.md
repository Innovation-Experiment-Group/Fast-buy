 # 商品管理系统

## 数据结构说明

### 商品（Commodity）
- id: 商品唯一标识符
- name: 商品名称
- description: 商品详细描述
- price: 商品价格
- imageUrl: 商品图片的URL地址
- attributes: 商品属性（如材质、颜色、尺寸等）
- stock: 当前库存数量
- category: 商品分类
- createdAt: 商品创建时间
- updatedAt: 商品最后更新时间

### 客户（Client）
- code: 客户唯一代码
- name: 客户姓名
- contact: 客户联系方式
- country: 客户所在国家
- language: 客户使用的语言
- timezone: 客户所在时区（小时偏移量）

### 运单（Shipment）
- trackingNumber: 运单号（由客户代码+货物简称+包裹数+时间戳组成）
- clientCode: 关联的客户代码
- transportMethod: 运输方式（海运/空运）
- estimatedDays: 预计运输天数
- status: 运单当前状态
- createdAt: 运单创建时间
- departureDate: 发货日期
- arrivalDate: 到达日期
- pickupDate: 提货日期
- cargoCode: 货物简称（不超过16字符）
- cargoDetails: 货物详细描述
- packageCount: 包裹数量
- portTimezone: 发货港口时区（小时偏移量）

## 文件结构
- lib/models/: 数据模型定义
- _data/: 数据文件存储
  - commodity_list.yaml: 商品列表数据
  - clients.yaml: 客户列表数据

## 使用说明
1. 商品展示页面：展示所有商品列表
2. 商品属性页面：显示商品的详细属性信息
3. 商品购买页面：处理商品购买流程
4. 运单管理：管理所有运单信息