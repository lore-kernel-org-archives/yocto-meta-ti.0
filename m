Return-Path: <deepakvijay2255@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 465E1E00BD3
	for <meta-ti@yoctoproject.org>; Sun, 27 Apr 2014 21:48:16 -0700 (PDT)
Received: by mail-la0-f41.google.com with SMTP id el20so2335306lab.28
	for <meta-ti@yoctoproject.org>; Sun, 27 Apr 2014 21:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=b6Ui5uVcuLR8wGlsEac2VQ+25Dxyk8INWyOl7olqXKA=;
	b=TlCu9c7uMjt2kpnxd1Tz++0FeK/36x9RZkFKZN7fmyll5kHMs2MaZS6wCFcElJzn+7
	mMqBhBRbUeMJRXWA90mYx+HNm9/w4BpOQBolnhOXmcWd6uWU5712ISIW6kcHSPA8ofZu
	HGXJHbtSGnutOJ76yn/5z0fVuiJ9kCrOpdTUwUNDqKu7Q3DA5KKeQmZ/RX16T+zM/xp5
	5CMyC5UOnXHgLvsf1Cp9SWuIKYm52TN95NKy5NqliroBo+cwVa3oIDiDvTH51CgzbrhH
	B8ttTnZ44AXtA3AJ2cSZrO8aDrR0VmzNRPYs67dblyizyFXgifq/8yH85vDXuBM7Rxhu
	zkIQ==
MIME-Version: 1.0
X-Received: by 10.152.9.8 with SMTP id v8mr145790laa.36.1398660495165; Sun, 27
	Apr 2014 21:48:15 -0700 (PDT)
Sender: deepakvijay2255@gmail.com
Received: by 10.112.47.70 with HTTP; Sun, 27 Apr 2014 21:48:15 -0700 (PDT)
In-Reply-To: <1480338079.589.1398647063864.JavaMail.jenkins@puget>
References: <1480338079.589.1398647063864.JavaMail.jenkins@puget>
Date: Mon, 28 Apr 2014 10:18:15 +0530
X-Google-Sender-Auth: 44MLtE6-w8OnR8sxa_pCFb6ajBw
Message-ID: <CAAxuRXhZfchrkLbo0pRcqJa62HAztYHOemrZ_WGhkwa67ogTPw@mail.gmail.com>
From: deepak vijay <deepakvijay2255@rediff.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [nightly] Distroless meta-ti/master minimal build 2014-04-27_21-00-24
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Apr 2014 04:48:17 -0000
Content-Type: multipart/alternative; boundary=089e01537baaf9cf4f04f8130512

--089e01537baaf9cf4f04f8130512
Content-Type: text/plain; charset=UTF-8

Hi,
I also got the same problem. Like the build of beaglebone-daisy-11.0.0 for
beagleborn was successful and when I tested the images on a target board
was failing.
I also checked boot configuration mismatch is happening or not, but it was
configured proper.
Can anyone help to resolve this problem?

 Regards,
Deepak


On Mon, Apr 28, 2014 at 6:34 AM, Denys Dmytriyenko <denys@ti.com> wrote:

>  Status for 04/27/14 BUILD_ID: build-2014-04-27_21-01-31 Clean Build:
> false Clean Sources: false *Repository Revisions*  Repository Git URL
> Branch Commit ID Layers  bitbake git://git.openembedded.org/bitbake master
> HEAD layers=  meta-ti git://git.yoctoproject.org/meta-ti master HEAD
> layers=  oe-core git://git.openembedded.org/openembedded-core master HEAD
> layers=meta  *Build and Target Test Results*  Machine Build Result Target
> Test Result  am335x-evm PASSED FAILED  am37x-evm PASSED FAILED  am3517-evm
> PASSED FAILED  am180x-evm FAILED SKIPPED  omap5-evm PASSED FAILED
> dra7xx-evm PASSED FAILED  keystone-evm FAILED SKIPPED  beagleboard PASSED
> FAILED  beaglebone PASSED SKIPPED  pandaboard PASSED SKIPPED
>
> These builds were performed using the build-oesdk.sh script at:
>
> git://arago-project.org/git/projects/tisdk-build-scripts.git
>
> The configuration file passed to this script had the contents:
>
> MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID
> SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER
> FS_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
> TISDK_VERSION="2014.03"
> MACHINES="am335x-evm am37x-evm am3517-evm am180x-evm omap5-evm dra7xx-evm
> keystone-evm beagleboard beaglebone pandaboard"
> NUM_ARM9_BUILDS="1"
> NUM_CORTEX_BUILDS="2"
> BUILD_ID="`date +build-%F_%H-%M-%S`"
> SCRIPTS_ROOT="$PWD"
> BUILD_ROOT="/home/jenkins/distroless-build"
> TEST_ROOT="$BUILD_ROOT/testing"
> PACKAGE_ROOT="$BUILD_ROOT/packaging"
> DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
> FS_FILTER="core-image-minimal-"
> FS_IMAGE_TYPE="tar.gz"
> NFS_ROOT="/home/jenkins/nfs-root"
> SOURCE_DIR="${BUILD_ROOT}/sources"
> CLEAN_BUILD="false"
> CLEAN_ALL="false"
> CONFIG_FILE="${BUILD_ROOT}/configs/distroless-meta-ti-config.txt"
> LOG_DIR="${BUILD_ROOT}/log-files"
> DL_DIR="/OE/downloads"
> INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"
> TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
> TEST_SCRIPTS_TGT="home/root/test-scripts"
> TEST_LOCAL_IFACE="eth1"
> OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
> OPENTEST_TEE_IP="10.218.102.142"
> OPENTEST_HW_CAP="linux_tigt_farm"
> RUN_BUILD_TESTS="true"
> STAF_ROOT="/usr/local/staf"
> SKIP_TEST_FAILURES="false"
> PRODUCTIZE_SDK="false"
> BITBAKE_COMMAND="core-image-minimal"
> RESULTS_CONFIG_COMMENTS="false"
> BACKUP_RESULTS="/home/jenkins/jobs/distroless-meta-ti-nightly/workspace"
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--089e01537baaf9cf4f04f8130512
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I also got the same problem. Like the build of=C2=
=A0beaglebone-daisy-11.0.0 for beagleborn was successful and when I tested =
the images on a target board was failing.=C2=A0</div><div>I also checked bo=
ot configuration mismatch is happening or not, but it was configured proper=
.</div>
<div>Can anyone help to resolve this problem?</div><div><br></div><div>=C2=
=A0Regards,</div><div>Deepak</div><div class=3D"gmail_extra"><br><br><div c=
lass=3D"gmail_quote">On Mon, Apr 28, 2014 at 6:34 AM, Denys Dmytriyenko <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@=
ti.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">



<div>

<h2>Status for 04/27/14</h2>

<h2>BUILD_ID: build-2014-04-27_21-01-31</h2>

<h2>Clean Build: false</h2>

<h2>Clean Sources: false</h2>
<h2><u>Repository Revisions</u></h2>
<table border=3D"1" cellspacing=3D"1" cellpadding=3D"1">
    <tbody><tr>
        <th>Repository</th>
        <th>Git URL</th>
        <th>Branch</th>
        <th>Commit ID</th>
        <th>Layers</th>
    </tr>

    <tr>
        <td>bitbake</td>
        <td>git://<a href=3D"http://git.openembedded.org/bitbake" target=3D=
"_blank">git.openembedded.org/bitbake</a></td>
        <td>master</td>
        <td>HEAD</td>
        <td>layers=3D</td>
    </tr>
    <tr>
        <td>meta-ti</td>
        <td>git://<a href=3D"http://git.yoctoproject.org/meta-ti" target=3D=
"_blank">git.yoctoproject.org/meta-ti</a></td>
        <td>master</td>
        <td>HEAD</td>
        <td>layers=3D</td>
    </tr>
    <tr>
        <td>oe-core</td>
        <td>git://<a href=3D"http://git.openembedded.org/openembedded-core"=
 target=3D"_blank">git.openembedded.org/openembedded-core</a></td>
        <td>master</td>
        <td>HEAD</td>
        <td>layers=3Dmeta</td>
    </tr>
</tbody></table>
<h2><u>Build and Target Test Results</u></h2>
<table border=3D"1" cellspacing=3D"1" cellpadding=3D"1">
    <tbody><tr>
        <th>Machine</th>
        <th>Build Result</th>
        <th>Target Test Result</th>
    </tr>
    <tr>
        <td>am335x-evm</td>
        <td bgcolor=3D"lime">PASSED</td>
        <td bgcolor=3D"red">FAILED</td>
    </tr>
    <tr>
        <td>am37x-evm</td>
        <td bgcolor=3D"lime">PASSED</td>
        <td bgcolor=3D"red">FAILED</td>
    </tr>
    <tr>
        <td>am3517-evm</td>
        <td bgcolor=3D"lime">PASSED</td>
        <td bgcolor=3D"red">FAILED</td>
    </tr>
    <tr>
        <td>am180x-evm</td>
        <td bgcolor=3D"red">FAILED</td>
        <td bgcolor=3D"yellow">SKIPPED</td>
    </tr>
    <tr>
        <td>omap5-evm</td>
        <td bgcolor=3D"lime">PASSED</td>
        <td bgcolor=3D"red">FAILED</td>
    </tr>
    <tr>
        <td>dra7xx-evm</td>
        <td bgcolor=3D"lime">PASSED</td>
        <td bgcolor=3D"red">FAILED</td>
    </tr>
    <tr>
        <td>keystone-evm</td>
        <td bgcolor=3D"red">FAILED</td>
        <td bgcolor=3D"yellow">SKIPPED</td>
    </tr>
    <tr>
        <td>beagleboard</td>
        <td bgcolor=3D"lime">PASSED</td>
        <td bgcolor=3D"red">FAILED</td>
    </tr>
    <tr>
        <td>beaglebone</td>
        <td bgcolor=3D"lime">PASSED</td>
        <td bgcolor=3D"yellow">SKIPPED</td>
    </tr>
    <tr>
        <td>pandaboard</td>
        <td bgcolor=3D"lime">PASSED</td>
        <td bgcolor=3D"yellow">SKIPPED</td>
    </tr>
</tbody></table>

<p>
These builds were performed using the build-oesdk.sh script at:
</p>
<p>
git://<a href=3D"http://arago-project.org/git/projects/tisdk-build-scripts.=
git" target=3D"_blank">arago-project.org/git/projects/tisdk-build-scripts.g=
it</a>
</p>

<p>
The configuration file passed to this script had the contents:
</p>
<p>
MANDATORY_INPUTS=3D&quot;MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_I=
D SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_I=
MAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION&quot;<br>
TISDK_VERSION=3D&quot;2014.03&quot;<br>
MACHINES=3D&quot;am335x-evm am37x-evm am3517-evm am180x-evm omap5-evm dra7x=
x-evm keystone-evm beagleboard beaglebone pandaboard&quot;<br>
NUM_ARM9_BUILDS=3D&quot;1&quot;<br>
NUM_CORTEX_BUILDS=3D&quot;2&quot;<br>
BUILD_ID=3D&quot;`date +build-%F_%H-%M-%S`&quot;<br>
SCRIPTS_ROOT=3D&quot;$PWD&quot;<br>
BUILD_ROOT=3D&quot;/home/jenkins/distroless-build&quot;<br>
TEST_ROOT=3D&quot;$BUILD_ROOT/testing&quot;<br>
PACKAGE_ROOT=3D&quot;$BUILD_ROOT/packaging&quot;<br>
DEPLOY_ROOT=3D&quot;$BUILD_ROOT/deploy/$TISDK_VERSION&quot;<br>
FS_FILTER=3D&quot;core-image-minimal-&quot;<br>
FS_IMAGE_TYPE=3D&quot;tar.gz&quot;<br>
NFS_ROOT=3D&quot;/home/jenkins/nfs-root&quot;<br>
SOURCE_DIR=3D&quot;${BUILD_ROOT}/sources&quot;<br>
CLEAN_BUILD=3D&quot;false&quot;<br>
CLEAN_ALL=3D&quot;false&quot;<br>
CONFIG_FILE=3D&quot;${BUILD_ROOT}/configs/distroless-meta-ti-config.txt&quo=
t;<br>
LOG_DIR=3D&quot;${BUILD_ROOT}/log-files&quot;<br>
DL_DIR=3D&quot;/OE/downloads&quot;<br>
INSTALLER_EXTRAS_ROOT=3D&quot;/home/jenkins/extra-files/installer_content&q=
uot;<br>
TEST_SCRIPTS=3D&quot;$SCRIPTS_ROOT/test-scripts&quot;<br>
TEST_SCRIPTS_TGT=3D&quot;home/root/test-scripts&quot;<br>
TEST_LOCAL_IFACE=3D&quot;eth1&quot;<br>
OPENTEST_CLI=3D&quot;$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz&quot;<br>
OPENTEST_TEE_IP=3D&quot;10.218.102.142&quot;<br>
OPENTEST_HW_CAP=3D&quot;linux_tigt_farm&quot;<br>
RUN_BUILD_TESTS=3D&quot;true&quot;<br>
STAF_ROOT=3D&quot;/usr/local/staf&quot;<br>
SKIP_TEST_FAILURES=3D&quot;false&quot;<br>
PRODUCTIZE_SDK=3D&quot;false&quot;<br>
BITBAKE_COMMAND=3D&quot;core-image-minimal&quot;<br>
RESULTS_CONFIG_COMMENTS=3D&quot;false&quot;<br>
BACKUP_RESULTS=3D&quot;/home/jenkins/jobs/distroless-meta-ti-nightly/worksp=
ace&quot;<br>
</p>

</div>


<br>--<br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
<br></blockquote></div><br></div></div>

--089e01537baaf9cf4f04f8130512--
