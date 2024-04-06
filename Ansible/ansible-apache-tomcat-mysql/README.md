## 概要
Apache + Tomcat + MySQL の環境を構築する。

## 準備
```bash
cp hosts.example hosts

vim hosts
```

`group_vars` の認証情報を編集する。
```bash
vim group_vars/all.yml
```

`MySQL` のモジュールを入れる
```bash
ansible-galaxy collection install community.mysql
```

## テスト
```bash
ansible-playbook -i hosts test.yml
```

## プレイブックの実行
```bash
ansible-playbook -i hosts site.yml
```
