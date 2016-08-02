## Installation options

- Check _Add Online Repositories Before Installation_
- Click __Next__

## Suggested Partitioning

- Click ___Expert Partitioner__

### Expert partitioner

- Right click on __/home__ partition
- Click __Edit__
- Select _Encrypt Device_
- Click __Next__
- Enter password
- Click __Finish__
- Click __Accept__
- Click __Yes__

### Suggested Partitioning

- Click __Next__

## Clock and Time Zone

- Select _Europe_ under _Region_
- Select _Netherlands_ under _Time Zone_
- Click __Next__

## List of Repositories

- Check _Update Repository (Non-OSS)_
- Check _Main Update Repository_
- Check _Main Repository (Non-OSS)_
- Check _Main Repository (OSS)_
- Click __Next__

## Desktop Selection

- Check _GNOME Desktop_
- Click __Next__

## Create New User

- Fill in all fields
- Check _Use this password for system administrator_
- Uncheck _Automatic login_
- Click __Next__

## Installation Settings

- Click __Software__

### Software Selection and System Tasks

#### Graphical Environments

- Select _GNOME Base System_
- Select _GNOME Desktop Environment_
- Select _Fonts_
- Select _X Window System_

#### Desktop Functions

- Select _Multimedia_
- Select _Office Software_
- Select _Graphics_
- Unselect _Games_
- Select _Remote Desktop_
- Select _Technical Writing_

#### Base Technologies

- Select _Base System_
- Select _Enhanced Base System_
- Select _AppArmor_
- Select _64-Bit Runtime Environment_
- Select _x86 Runtime Environment_
- Select _Laptop_ - __IF NEEDED__
- Select _Yast System Administration_
- Select _Yast Installation Packages_

#### Server Functions

- Select _Web and LAMP Server_

#### Proprietary Software

- Select _Misc. Proprietary Packages_

#### Development

- Select _Base Development_
- Select _GNOME Development_
- Select _C/C++ Development_
- Select _Integrated Development Environments_
- Select _RPM Build Environment_
- Select _Java Development_
- Select _Ryby Development_
- Select _Web Development_

- Click __OK__

### Confirm Installation

- Click __Install__

# After Installation

- Drop to tty2 (__ctrl + alt + f2__)
- Install git (__zypper in git__)
- Clone repo (__git clone https://github.com/bartkessels/opensuse\_setup__)
- Go to _GNOME/_ folder (__cd opensuse\_setup/GNOME__)
- Execute _setup.sh_ (__sudo bash setup.sh__)