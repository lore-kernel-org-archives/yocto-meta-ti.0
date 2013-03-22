Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADA13E0141C
	for <meta-ti@yoctoproject.org>; Sat, 23 Mar 2013 12:30:41 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MK400KIQOUP6D50@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 23 Mar 2013 14:30:40 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0798320470; Sat,
	23 Mar 2013 15:30:25 -0400 (EDT)
Resent-from: Denys Dmytriyenko <denis@denix.org>
Resent-date: Sat, 23 Mar 2013 15:30:25 -0400
Resent-message-id: <20130323193025.GC30363@denix.org>
Resent-to: meta-ti@yoctoproject.org
Received: from arago-project.org
	(ec2-184-73-161-183.compute-1.amazonaws.com [184.73.161.183])
	by gandalf.denix.org (Postfix) with ESMTP id 101FF20033	for
	<denis@denix.org>; Fri, 22 Mar 2013 01:34:14 -0400 (EDT)
Received: from ip-10-46-145-36.ec2.internal (localhost [127.0.0.1])
	by arago-project.org (Postfix) with ESMTP id DCD2452A21; Fri,
	22 Mar 2013 05:34:12 +0000 (UTC)
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7A81B52A21	for
	<meta-arago@arago-project.org>; Fri, 22 Mar 2013 05:33:59 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2M5XuFx031923	for
	<meta-arago@arago-project.org>; Fri, 22 Mar 2013 00:33:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2M5XukA008671	for
	<meta-arago@arago-project.org>; Fri, 22 Mar 2013 00:33:56 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197)
	by DFLE72.ent.ti.com	(128.247.5.109) with Microsoft SMTP Server id
	14.2.342.3; Fri, 22 Mar 2013 00:33:56 -0500
Received: from puget.gt.design.ti.com ([158.218.102.159])
	by	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2M5XtMR013545	for
	<meta-arago@arago-project.org>; Fri, 22 Mar 2013 00:33:56 -0500
Date: Fri, 22 Mar 2013 01:29:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-id: <2030779752.71.1363930148617.JavaMail.jenkins@puget>
MIME-version: 1.0
X-Jenkins-Job: arago-core-tisdk-nightly
X-Jenkins-Result: SUCCESS
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
Sender: meta-arago-bounces@arago-project.org
Errors-to: meta-arago-bounces@arago-project.org
X-Bogosity: Unsure, tests=bogofilter, spamicity=0.500000, version=1.2.1
Subject: [meta-arago] [nightly] Core TISDK 2013.03 build 2013-03-22_01-01-06
X-BeenThere: meta-ti@yoctoproject.org
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Mar 2013 19:30:41 -0000
Content-type: multipart/mixed;
	boundary="----=_Part_70_2092023148.1363930148614"

------=_Part_70_2092023148.1363930148614
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
<head>
<title>
Status for 03/22/13
</title>
</head>
<body>

<h2>Status for 03/22/13</h2>

<h2>BUILD_ID: build-2013-03-22_01-02-08</h2>

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
        <td>1.17.0</td>
        <td>layers=</td>
    </tr>
    <tr>
        <td>meta-arago</td>
        <td>git://arago-project.org/git/meta-arago.git</td>
        <td>master</td>
        <td>HEAD</td>
        <td>layers=meta-arago-distro:meta-arago-extras</td>
    </tr>
    <tr>
        <td>meta-openembedded</td>
        <td>git://git.openembedded.org/meta-openembedded</td>
        <td>danny</td>
        <td>HEAD</td>
        <td>layers=toolchain-layer:meta-oe</td>
    </tr>
    <tr>
        <td>meta-ti</td>
        <td>git://arago-project.org/git/meta-ti.git</td>
        <td>danny</td>
        <td>HEAD</td>
        <td>layers=</td>
    </tr>
    <tr>
        <td>meta-linaro</td>
        <td>git://git.linaro.org/openembedded/meta-linaro.git</td>
        <td>danny</td>
        <td>HEAD</td>
        <td>layers=</td>
    </tr>
    <tr>
        <td>oe-core</td>
        <td>git://git.openembedded.org/openembedded-core</td>
        <td>danny</td>
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
        <td bgcolor=lime>PASSED</td>
    </tr>
    <tr>
        <td>am37x-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>beagleboard</td>
        <td bgcolor=red>FAILED</td>
        <td bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>am3517-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=lime>PASSED</td>
    </tr>
    <tr>
        <td>am180x-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=lime>PASSED</td>
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
MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"<br>
TISDK_VERSION="2013.03"<br>
MACHINES="am335x-evm am37x-evm beagleboard am3517-evm am180x-evm"<br>
NUM_ARM9_BUILDS="1"<br>
NUM_CORTEX_BUILDS="1"<br>
TOOLCHAIN_ROOT_ARM9="/opt/arago-2011.09/armv5te/bin/"<br>
TOOLCHAIN_ROOT_CORTEX="/opt/arago-2011.09/armv7a/bin/"<br>
BUILD_ID="`date +build-%F_%H-%M-%S`"<br>
SCRIPTS_ROOT="$PWD"<br>
BUILD_ROOT="/home/jenkins/tisdk-build"<br>
TEST_ROOT="$BUILD_ROOT/testing"<br>
PACKAGE_ROOT="$BUILD_ROOT/packaging"<br>
DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"<br>
FS_FILTER="tisdk-rootfs-"<br>
FS_IMAGE_TYPE="tar.gz"<br>
SDK_FILTER="arago-amsdk-image-"<br>
SDK_IMAGE_TYPE="tar.gz"<br>
NFS_ROOT="/home/jenkins/nfs-root"<br>
SOURCE_DIR="${BUILD_ROOT}/sources"<br>
CLEAN_BUILD="false"<br>
CLEAN_ALL="false"<br>
CONFIG_FILE="${BUILD_ROOT}/configs/arago-danny-config.txt"<br>
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
BITBAKE_COMMAND="arago-amsdk-image"<br>
RESULTS_CONFIG_COMMENTS="false"<br>
INSTALL_JAMMER="/home/jenkins/installjammer"<br>
INSTALLER_ROOT="$BUILD_ROOT/installer"<br>
MPI_FILE="$SCRIPTS_ROOT/mpi-files/ti-sdk-base.mpi"<br>
SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"<br>
WEBGEN_ROOT="/home/jenkins/webgen"<br>
WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"<br>
WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data"<br>
COPY_TO_WEB="true"<br>
WEB_HOST=""<br>
CLEAN_AFTER_COPY="true"<br>
BACKUP_RESULTS="/home/jenkins/jobs/arago-core-tisdk-nightly/workspace"<br>
</p>

</body>
</html>


------=_Part_70_2092023148.1363930148614
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

------=_Part_70_2092023148.1363930148614--
