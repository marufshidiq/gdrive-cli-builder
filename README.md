# GDrive CLI Builder
[GDrive CLI](https://github.com/gdrive-org/gdrive) is a great tools, but because the owner is hardcoded the credentials directly to the [code](https://github.com/prasmussen/gdrive/blob/c3cbcceedd6beb1fcff30f06ea7be7c29558d181/handlers_drive.go#L17), it's makes every one who use the [release package](https://github.com/gdrive-org/gdrive/releases) from this project is sharing the same quota. So i try to make this repository to help who want to build the package using their own credentials.

<details>
<summary>
    Problems that arise due to limit quota
</summary>

![Error](./assets/error.png)

```html
Sign in with Google temporarily disabled for this app
This app has not been verified yet by Google in order to use Google Sign In.
```

</details>

## Prerequisites
- GitHub Account
- Google Account

## How to
<details>
<summary>
    Create your own Google Drive API credentials
</summary>

1. Go to Google developer [console](https://console.developers.google.com/apis/dashboard) and create new project
    >> P.S. This page only shown if it's your first time accesing Google developer console

    - Read terms and conditions ✌ and then click `ACCEPT AND CONTINUE`

    ![Step 1](./assets/step1.jpg)

    - Create a project if you have not yet by click the `CREATE PROJECT` button

    ![Step 2](./assets/step2.jpg)

    - Fill out your project name and then click `CREATE`

    ![Step 3](./assets/step3.jpg)

2. Go to Google Drive API [section](https://console.developers.google.com/apis/library/drive.googleapis.com) and enable it
    - Click `ACTIVATE`

    ![Step 4](./assets/step4.jpg)

3. Create Credential [1]
    - Click `CREATE CREDENTIAL`

    ![Step 5](./assets/step5.jpg)

    - Fill out the form and then click `What credentials do I need?`

    ![Step 6](./assets/step6.jpg)

4. Create OAuth consent screen
    - Click `SET UP CONSENT SCREEN`

    ![Step 7](./assets/step7.jpg)

    - Choose External and then click `CREATE`

    ![Step 8](./assets/step8.jpg)

    - Fill out the form and then click `SAVE`

    ![Step 9](./assets/step9.jpg)

5. Create Credential [2]
    - Fill out your client id name and then click `CREATE OAUTH CLIENT ID`

    ![Step 10](./assets/step10.jpg)

    - Download your `client_id.json` file and keep this file

    ![Step 11](./assets/step11.jpg)

</details>

<details>
<summary>
    Setup GitHub Actions
</summary>

1. Fork this repository
    - Click the `fork` button

    ![Step 12](./assets/step12.jpg)

2. Enable GitHub Actions in your repository
    - Click the `Actions` tab and then click `I understand my workflows, go ahead and run them`

    ![Enable](./assets/enable.png)

3. Create secret that contain your CLIENT_ID and CLIENT_SECRET
    - Click `Settings` > `Secrets` > `Add a new secret`

    ![Step 13](./assets/step13.jpg)

    - Open your `client_id.json` file then copy `CLIENT_ID` and `CLIENT_SECRET` to create secrets

    ![Step 14](./assets/step14.jpg)
    ![Step 15](./assets/step15.jpg)
    ![Step 16](./assets/step16.jpg)

    - Make sure you have CLIENT_ID and CLIENT_SECRET secret

    ![Step 17](./assets/step17.jpg)
</details>

<details>
<summary>
    Build GDrive CLI using GitHub Actions
</summary>

1. Choose your platform by editing the [`list.txt`](./build/list.txt) file inside build directory

    ![Step 18](./assets/step18.jpg)

    - Edit file by click the pencil icon

    ![Step 19](./assets/step19.jpg)

    - Write your platform in `list.txt` file. You can write multiple platform (split by line)

        <details>
        <summary>
            <b>Supported platfrom</b>
        </summary>

        - darwin/386
        - darwin/amd64
        - darwin/arm
        - darwin/arm64
        - dragonfly/amd64
        - freebsd/386
        - freebsd/amd64
        - freebsd/arm
        - linux/386
        - linux/amd64
        - linux/arm
        - linux/arm64
        - linux/ppc64
        - linux/ppc64le
        - linux/mips64
        - linux/mips64le
        - linux/rpi
        - netbsd/386
        - netbsd/amd64
        - netbsd/arm
        - openbsd/386
        - openbsd/amd64
        - openbsd/arm
        - plan9/386
        - plan9/amd64
        - solaris/amd64
        - windows/386
        - windows/amd64
        </details>

    ![Step 20](./assets/step20.jpg)

    - Save this file by commit the change

    >> P.S. Because GitHub Actions didn't have manual trigger to build, so we only can trigger the build process by commit changes and push it to `master` branch

    ![Step 21](./assets/step21.jpg)

    - Inspect your build process by click `Actions` > `Build GDrive CLI` workflow > `{Your commit message}` *i.e.* **Update list.txt**

    ![Step 22](./assets/step22.jpg)

    - Make sure all step is successfully build

    ![Step 23](./assets/step23.jpg)

    - If the build process has been finished, you can download the file by click `Artifacts` button in top-right section

    >> P.S. You can also delete this file by click the trash icon so another user cannot download this file

    ![Step 24](./assets/step24.jpg)
</details>

<details>
<summary>
    Using GDrive CLI
</summary>

On unix systems run `chmod +x {filename}` after download to make the binary executable.

[Official documentation](https://github.com/gdrive-org/gdrive#usage)
</details>

### Contributors
- Ma'ruf Shidiq - *Initialize GitHub Actions workflow* - [marufshidiq](https://github.com/marufshidiq)
- Văn Lộc Võ - *Add support to compile for mips/mipsle architecture* - [vvanloc](https://github.com/vvanloc)

### Thanks to
[prasmussen](https://github.com/prasmussen) and [all](https://github.com/gdrive-org/gdrive/graphs/contributors) GDrive CLI contributor for creating a great tools