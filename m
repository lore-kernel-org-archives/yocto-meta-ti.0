Return-Path: <hozer@grid.coop>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E07E7E009C5; Thu, 21 Jan 2016 09:57:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from nl.grid.coop (nl.grid.coop [50.7.166.116])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5113DE007D9
	for <meta-ti@yoctoproject.org>; Thu, 21 Jan 2016 09:57:41 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (uid 1000)
	by nl.grid.coop with local; Thu, 21 Jan 2016 11:57:39 -0600
	id 00000000000613F9.0000000056A11C13.000020BC
Date: Thu, 21 Jan 2016 11:57:39 -0600
From: Troy Benjegerdes <hozer@hozed.org>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20160121175739.GC4311@nl.grid.coop>
References: <1553022806.315.1453345214827.JavaMail.jenkins@puget>
Mime-Version: 1.0
In-Reply-To: <1553022806.315.1453345214827.JavaMail.jenkins@puget>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-ti@yoctoproject.org
Subject: Re: [nightly] Distroless meta-ti/master minimal build 2016-01-20_21-00-32
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: troy@7el.us
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jan 2016 17:57:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Can I find the binaries from the historical am3517-evm builds
somewhere, or would I need to run the script myself?

On Wed, Jan 20, 2016 at 10:00:14PM -0500, Denys Dmytriyenko wrote:
> Status for 01/20/16
> 
> BUILD_ID: build-2016-01-20_21-01-45
> 
> Clean Build: false
> 
> Clean Sources: false
> 
> Repository Revisions
> 
> +---------------------------------------------------------------------------------+
> |Repository|Git URL                                     |Branch|Commit|Layers     |
> |          |                                            |      |ID    |           |
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
>    +-------------------------------------------+
>    |Machine    |Build Result|Target Test Result|
>    |-----------+------------+------------------|
>    |am335x-evm |PASSED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |am437x-evm |FAILED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |am37x-evm  |FAILED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |am3517-evm |FAILED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |am180x-evm |FAILED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |omap5-evm  |PASSED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |dra7xx-evm |FAILED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |am57xx-evm |FAILED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |k2hk-evm   |PASSED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |k2e-evm    |PASSED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |k2l-evm    |PASSED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |beagleboard|FAILED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |beaglebone |PASSED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |pandaboard |PASSED      |SKIPPED           |
>    +-------------------------------------------+
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
>    TISDK_VERSION="2015.05"
>    MACHINES="am335x-evm am437x-evm am37x-evm am3517-evm am180x-evm omap5-evm
>    dra7xx-evm am57xx-evm k2hk-evm k2e-evm k2l-evm beagleboard beaglebone
>    pandaboard"
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
>    CLEAN_BUILD="false"
>    CLEAN_SSTATE="false"
>    CLEAN_ALL="false"
>    CONFIG_FILE="${BUILD_ROOT}/configs/distroless-meta-ti-config.txt"
>    LOG_DIR="${BUILD_ROOT}/log-files"
>    BUILD_LOG_VERBOSE="true"
>    DL_DIR="/OE/downloads"
>    BB_GENERATE_MIRROR_TARBALLS="0"
>    INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"
>    TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
>    TEST_SCRIPTS_TGT="home/root/test-scripts"
>    TEST_LOCAL_IFACE="eth1"
>    OPENTEST_CLI="$SCRIPTS_ROOT/linux-devtest.tgz"
>    OPENTEST_TEE_IP="none"
>    OPENTEST_HW_CAP="linux_tigt_farm"
>    OPENTEST_BOOTLOADERS="false"
>    RUN_BUILD_TESTS="false"
>    STAF_ROOT="/usr/local/staf"
>    SKIP_TEST_FAILURES="false"
>    PRODUCTIZE_SDK="false"
>    BITBAKE_COMMAND="core-image-minimal"
>    RESULTS_CONFIG_COMMENTS="false"
>    INSTALL_BUILDER="/home/jenkins/installbuilder"
>    INSTALLER_ROOT="$BUILD_ROOT/installer"
>    INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
>    INSTALLER_PREFIX="ti-sdk"
>    SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
>    PACKAGE_BOOT_KERNEL_FILES="false"
>    WEBGEN_ROOT="/home/jenkins/webgen"
>    WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
>    WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/$TISDK_VERSION"
>    EXPORT_ARAGO_SRC="0"
>    COPY_TO_WEB="true"
>    COPY_DEPLOY_TO_WEB="true"
>    WEB_HOST="lcpdbld@lsblogin01.dal.design.ti.com:/web/lcpd/htdocs/core-minimal"
>    CLEAN_AFTER_COPY="true"
>    BACKUP_RESULTS="/home/jenkins/jobs/distroless-meta-ti-nightly/workspace"


