Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 736E7E009E5; Sun, 14 Jun 2015 18:03:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MIME_HTML_ONLY autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.7 MIME_HTML_ONLY BODY: Message only has text/html MIME parts
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 371B5E009E5
	for <meta-ti@yoctoproject.org>; Sun, 14 Jun 2015 18:03:12 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t5F13A5c007899
	for <meta-ti@yoctoproject.org>; Sun, 14 Jun 2015 20:03:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5F13Atp008905
	for <meta-ti@yoctoproject.org>; Sun, 14 Jun 2015 20:03:10 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 14 Jun 2015 20:03:10 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t5F139B4022022	for <meta-ti@yoctoproject.org>; Sun, 14 Jun 2015 20:03:10
	-0500
Date: Sun, 14 Jun 2015 21:03:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <1138466701.549.1434330189800.JavaMail.jenkins@puget>
MIME-Version: 1.0
X-Jenkins-Job: distroless-meta-ti-nightly
X-Jenkins-Result: SUCCESS
Subject: [nightly] Distroless meta-ti/master minimal build 2015-06-14_21-00-51
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
X-List-Received-Date: Mon, 15 Jun 2015 01:03:16 -0000
Content-Type: multipart/mixed;
	boundary="----=_Part_548_1049085453.1434330189771"

------=_Part_548_1049085453.1434330189771
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
<head>
<title>
Status for 06/14/15
</title>
</head>
<body>

<h2>Status for 06/14/15</h2>

<h2>BUILD_ID: build-2015-06-14_21-01-58</h2>

<h2>Clean Build: false</h2>

<h2>Clean Sources: false</h2>
<h2><u>Repository Revisions</u></h2>
<table border=1 cellspacing=1 cellpadding=1>
    <tr>
        <th>Repository</th>
        <th>Git URL</th>
        <th>Branch</th>
        <th>Commit ID</th>
        <th>Layers</th>
    </tr>

    <tr>
        <td>bitbake</td>
        <td>git://git.openembedded.org/bitbake</td>
        <td>master</td>
        <td>HEAD</td>
        <td>layers=</td>
    </tr>
    <tr>
        <td>meta-ti</td>
        <td>git://git.yoctoproject.org/meta-ti</td>
        <td>master</td>
        <td>HEAD</td>
        <td>layers=</td>
    </tr>
    <tr>
        <td>oe-core</td>
        <td>git://git.openembedded.org/openembedded-core</td>
        <td>master</td>
        <td>HEAD</td>
        <td>layers=meta</td>
    </tr>
</table>
<h2><u>Build and Target Test Results</u></h2>
<table border=1 cellspacing=1 cellpadding=1>
    <tr>
        <th>Machine</th>
        <th>Build Result</th>
        <th>Target Test Result</th>
    </tr>
    <tr>
        <td>am335x-evm</td>
        <td id="am335x-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="am335x-evm-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>am437x-evm</td>
        <td id="am437x-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="am437x-evm-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>am37x-evm</td>
        <td id="am37x-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="am37x-evm-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>am3517-evm</td>
        <td id="am3517-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="am3517-evm-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>am180x-evm</td>
        <td id="am180x-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="am180x-evm-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>omap5-evm</td>
        <td id="omap5-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="omap5-evm-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>dra7xx-evm</td>
        <td id="dra7xx-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="dra7xx-evm-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>am57xx-evm</td>
        <td id="am57xx-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="am57xx-evm-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>k2hk-evm</td>
        <td id="k2hk-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="k2hk-evm-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>k2e-evm</td>
        <td id="k2e-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="k2e-evm-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>k2l-evm</td>
        <td id="k2l-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="k2l-evm-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>beagleboard</td>
        <td id="beagleboard-build-result" bgcolor=lime>PASSED</td>
        <td id="beagleboard-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>beaglebone</td>
        <td id="beaglebone-build-result" bgcolor=lime>PASSED</td>
        <td id="beaglebone-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>pandaboard</td>
        <td id="pandaboard-build-result" bgcolor=lime>PASSED</td>
        <td id="pandaboard-target-result" bgcolor=yellow>SKIPPED</td>
    </tr>
</table>

<p>
These builds were performed using the build-oesdk.sh script at:
</p>
<p>
git://arago-project.org/git/projects/tisdk-build-scripts.git
</p>

<p>
The configuration file passed to this script had the contents:
</p>
<p>
MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"<br>
TISDK_VERSION="2015.05"<br>
MACHINES="am335x-evm am437x-evm am37x-evm am3517-evm am180x-evm omap5-evm dra7xx-evm am57xx-evm k2hk-evm k2e-evm k2l-evm beagleboard beaglebone pandaboard"<br>
NUM_ARM9_BUILDS="1"<br>
NUM_CORTEX_BUILDS="2"<br>
BUILD_ID="`date +build-%F_%H-%M-%S`"<br>
SCRIPTS_ROOT="$PWD"<br>
BUILD_ROOT="/home/jenkins/distroless-build"<br>
TEST_ROOT="$BUILD_ROOT/testing"<br>
PACKAGE_ROOT="$BUILD_ROOT/packaging"<br>
DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"<br>
FS_FILTER="core-image-minimal-"<br>
FS_IMAGE_TYPE="tar.gz"<br>
NFS_ROOT="/home/jenkins/nfs-root"<br>
SOURCE_DIR="${BUILD_ROOT}/sources"<br>
CLEAN_BUILD="false"<br>
CLEAN_SSTATE="false"<br>
CLEAN_ALL="false"<br>
CONFIG_FILE="${BUILD_ROOT}/configs/distroless-meta-ti-config.txt"<br>
LOG_DIR="${BUILD_ROOT}/log-files"<br>
BUILD_LOG_VERBOSE="true"<br>
DL_DIR="/OE/downloads"<br>
BB_GENERATE_MIRROR_TARBALLS="0"<br>
INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"<br>
TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"<br>
TEST_SCRIPTS_TGT="home/root/test-scripts"<br>
TEST_LOCAL_IFACE="eth1"<br>
OPENTEST_CLI="$SCRIPTS_ROOT/linux-devtest.tgz"<br>
OPENTEST_TEE_IP="none"<br>
OPENTEST_HW_CAP="linux_tigt_farm"<br>
OPENTEST_BOOTLOADERS="false"<br>
RUN_BUILD_TESTS="false"<br>
STAF_ROOT="/usr/local/staf"<br>
SKIP_TEST_FAILURES="false"<br>
PRODUCTIZE_SDK="false"<br>
BITBAKE_COMMAND="core-image-minimal"<br>
RESULTS_CONFIG_COMMENTS="false"<br>
INSTALL_BUILDER="/home/jenkins/installbuilder"<br>
INSTALLER_ROOT="$BUILD_ROOT/installer"<br>
INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"<br>
INSTALLER_PREFIX="ti-sdk"<br>
SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"<br>
PACKAGE_BOOT_KERNEL_FILES="false"<br>
WEBGEN_ROOT="/home/jenkins/webgen"<br>
WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"<br>
WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data"<br>
EXPORT_ARAGO_SRC="0"<br>
COPY_TO_WEB="true"<br>
COPY_DEPLOY_TO_WEB="true"<br>
WEB_HOST="lcpdbld@lsblogin01.dal.design.ti.com:/web/lcpd/htdocs/core-minimal"<br>
CLEAN_AFTER_COPY="true"<br>
BACKUP_RESULTS="/home/jenkins/jobs/distroless-meta-ti-nightly/workspace"<br>
</p>

</body>
</html>


------=_Part_548_1049085453.1434330189771--
