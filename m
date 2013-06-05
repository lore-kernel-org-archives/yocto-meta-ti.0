Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3F51E006C2
	for <meta-ti@yoctoproject.org>; Wed,  5 Jun 2013 11:37:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r55IbkIR026541
	for <meta-ti@yoctoproject.org>; Wed, 5 Jun 2013 13:37:46 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r55Ibkkh023382
	for <meta-ti@yoctoproject.org>; Wed, 5 Jun 2013 13:37:46 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Jun 2013 13:37:46 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r55Ibjgq000552	for
	<meta-ti@yoctoproject.org>; Wed, 5 Jun 2013 13:37:46 -0500
Date: Wed, 5 Jun 2013 14:37:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130605183745.GQ12092@edge>
References: <746733573.207.1370456641984.JavaMail.jenkins@puget>
MIME-Version: 1.0
In-Reply-To: <746733573.207.1370456641984.JavaMail.jenkins@puget>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [nightly] Distroless meta-ti/master minimal build 2013-06-05_12-37-16
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
X-List-Received-Date: Wed, 05 Jun 2013 18:37:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ok, so the clean build fixed the weird eglibc problems, again...

On Wed, Jun 05, 2013 at 02:24:01PM -0400, Denys Dmytriyenko wrote:
> Status for 06/05/13
> 
> BUILD_ID: build-2013-06-05_12-38-20
> 
> Clean Build: true
> 
> Clean Sources: false
> 
> Repository Revisions
> 
> +---------------------------------------------------------------------------------+
> |Repository|                  Git URL                   |Branch|Commit|  Layers   |
> |          |                                            |      |  ID  |           |
> |----------+--------------------------------------------+------+------+-----------|
> |bitbake   |git://git.openembedded.org/bitbake          |master|HEAD  |layers=    |
> |----------+--------------------------------------------+------+------+-----------|
> |meta-ti   |git://git.yoctoproject.org/meta-ti          |master|HEAD  |layers=    |
> |----------+--------------------------------------------+------+------+-----------|
> |oe-core   |git://git.openembedded.org/openembedded-core|master|HEAD  |layers=meta|
> +---------------------------------------------------------------------------------+
> 
> Build and Target Test Results
> 
>    +--------------------------------------------+
>    |  Machine   |Build Result|Target Test Result|
>    |------------+------------+------------------|
>    |am335x-evm  |PASSED      |FAILED            |
>    |------------+------------+------------------|
>    |am37x-evm   |PASSED      |FAILED            |
>    |------------+------------+------------------|
>    |am3517-evm  |PASSED      |FAILED            |
>    |------------+------------+------------------|
>    |am180x-evm  |PASSED      |FAILED: CRITICAL  |
>    |------------+------------+------------------|
>    |omap5-evm   |PASSED      |SKIPPED           |
>    |------------+------------+------------------|
>    |keystone-evm|PASSED      |FAILED: CRITICAL  |
>    |------------+------------+------------------|
>    |beagleboard |PASSED      |FAILED            |
>    |------------+------------+------------------|
>    |beaglebone  |PASSED      |SKIPPED           |
>    |------------+------------+------------------|
>    |pandaboard  |PASSED      |SKIPPED           |
>    +--------------------------------------------+
> 
>    These builds were performed using the build-oesdk.sh script at:
> 
>    git://arago-project.org/git/projects/tisdk-build-scripts.git
> 
>    The configuration file passed to this script had the contents:
> 
>    MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID
>    SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER
>    FS_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
>    TISDK_VERSION="2013.05"
>    MACHINES="am335x-evm am37x-evm am3517-evm am180x-evm omap5-evm
>    keystone-evm beagleboard beaglebone pandaboard"
>    NUM_ARM9_BUILDS="1"
>    NUM_CORTEX_BUILDS="2"
>    BUILD_ID="`date +build-%F_%H-%M-%S`"
>    SCRIPTS_ROOT="$PWD"
>    BUILD_ROOT="/home/jenkins/distroless-build"
>    TEST_ROOT="$BUILD_ROOT/testing"
>    PACKAGE_ROOT="$BUILD_ROOT/packaging"
>    DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
>    FS_FILTER="core-image-minimal-"
>    FS_IMAGE_TYPE="tar.gz"
>    NFS_ROOT="/home/jenkins/nfs-root"
>    SOURCE_DIR="${BUILD_ROOT}/sources"
>    CLEAN_BUILD="true"
>    CLEAN_ALL="false"
>    CONFIG_FILE="${BUILD_ROOT}/configs/distroless-meta-ti-config.txt"
>    LOG_DIR="${BUILD_ROOT}/log-files"
>    DL_DIR="/OE/downloads"
>    INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"
>    TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
>    TEST_SCRIPTS_TGT="home/root/test-scripts"
>    TEST_LOCAL_IFACE="eth1"
>    OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
>    OPENTEST_TEE_IP="10.218.102.142"
>    RUN_BUILD_TESTS="true"
>    STAF_ROOT="/usr/local/staf"
>    SKIP_TEST_FAILURES="false"
>    PRODUCTIZE_SDK="false"
>    BITBAKE_COMMAND="core-image-minimal"
>    RESULTS_CONFIG_COMMENTS="false"
>    BACKUP_RESULTS="/home/jenkins/jobs/distroless-meta-ti-nightly/workspace"

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


