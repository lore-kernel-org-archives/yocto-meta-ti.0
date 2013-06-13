Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C798DE01409
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 18:39:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5D1dkEY017319
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 20:39:46 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5D1dkfB018603
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 20:39:46 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 12 Jun 2013 20:39:46 -0500
Received: from puget.gt.design.ti.com ([158.218.102.159])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5D1dkl6010250	for
	<meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 20:39:46 -0500
Date: Wed, 12 Jun 2013 21:32:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <1355896682.239.1371087171156.JavaMail.jenkins@puget>
MIME-Version: 1.0
X-Jenkins-Job: distroless-meta-ti-nightly
X-Jenkins-Result: SUCCESS
Subject: [nightly] Distroless meta-ti/master minimal build 2013-06-12_21-01-44
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
X-List-Received-Date: Thu, 13 Jun 2013 01:39:48 -0000
Content-Type: multipart/mixed;
	boundary="----=_Part_238_1735240306.1371087171154"

------=_Part_238_1735240306.1371087171154
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
<head>
<title>
Status for 06/12/13
</title>
</head>
<body>

<h2>Status for 06/12/13</h2>

<h2>BUILD_ID: build-2013-06-12_21-02-49</h2>

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
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>am37x-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>am3517-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>am180x-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=red>FAILED: CRITICAL</td>
    </tr>
    <tr>
        <td>omap5-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>dra7xx-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>keystone-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=red>FAILED: CRITICAL</td>
    </tr>
    <tr>
        <td>beagleboard</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>beaglebone</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>pandaboard</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=yellow>SKIPPED</td>
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
TISDK_VERSION="2013.05"<br>
MACHINES="am335x-evm am37x-evm am3517-evm am180x-evm omap5-evm dra7xx-evm keystone-evm beagleboard beaglebone pandaboard"<br>
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
CLEAN_ALL="false"<br>
CONFIG_FILE="${BUILD_ROOT}/configs/distroless-meta-ti-config.txt"<br>
LOG_DIR="${BUILD_ROOT}/log-files"<br>
DL_DIR="/OE/downloads"<br>
INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"<br>
TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"<br>
TEST_SCRIPTS_TGT="home/root/test-scripts"<br>
TEST_LOCAL_IFACE="eth1"<br>
OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"<br>
OPENTEST_TEE_IP="10.218.102.142"<br>
RUN_BUILD_TESTS="true"<br>
STAF_ROOT="/usr/local/staf"<br>
SKIP_TEST_FAILURES="false"<br>
PRODUCTIZE_SDK="false"<br>
BITBAKE_COMMAND="core-image-minimal"<br>
RESULTS_CONFIG_COMMENTS="false"<br>
BACKUP_RESULTS="/home/jenkins/jobs/distroless-meta-ti-nightly/workspace"<br>
</p>

</body>
</html>


------=_Part_238_1735240306.1371087171154--
