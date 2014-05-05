Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FE97E00B5D; Mon,  5 May 2014 06:51:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E94A7E00B45
	for <meta-ti@yoctoproject.org>; Mon,  5 May 2014 06:51:53 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s45DpmVj014791;
	Mon, 5 May 2014 08:51:49 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s45Dpmn4029364;
	Mon, 5 May 2014 08:51:48 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 5 May 2014 08:51:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s45DpmAw022284;
	Mon, 5 May 2014 08:51:48 -0500
Date: Mon, 5 May 2014 09:51:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: deepak vijay <deepakvijay2255@rediff.com>
Message-ID: <20140505135148.GG18053@edge>
References: <1480338079.589.1398647063864.JavaMail.jenkins@puget>
	<CAAxuRXhZfchrkLbo0pRcqJa62HAztYHOemrZ_WGhkwa67ogTPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAxuRXhZfchrkLbo0pRcqJa62HAztYHOemrZ_WGhkwa67ogTPw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Mon, 05 May 2014 13:51:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 28, 2014 at 10:18:15AM +0530, deepak vijay wrote:
> Hi,
> I also got the same problem. Like the build of beaglebone-daisy-11.0.0 for
> beagleborn was successful and when I tested the images on a target board
> was failing.

BeagleBone on Daisy works out of the box. Please provide more details about 
the issues you are seeing.


> I also checked boot configuration mismatch is happening or not, but it was
> configured proper.
> Can anyone help to resolve this problem?

Run-time tests below are for distro-less setup and are not yet functional, due 
to the way they expect things setup. This will be fixed eventually, but actual 
run-time tests are being run against TI SDK builds and results sent to 
meta-arago mailing list.


> On Mon, Apr 28, 2014 at 6:34 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> >  Status for 04/27/14 BUILD_ID: build-2014-04-27_21-01-31 Clean Build:
> > false Clean Sources: false *Repository Revisions*  Repository Git URL
> > Branch Commit ID Layers  bitbake git://git.openembedded.org/bitbake master
> > HEAD layers=  meta-ti git://git.yoctoproject.org/meta-ti master HEAD
> > layers=  oe-core git://git.openembedded.org/openembedded-core master HEAD
> > layers=meta  *Build and Target Test Results*  Machine Build Result Target
> > Test Result  am335x-evm PASSED FAILED  am37x-evm PASSED FAILED  am3517-evm
> > PASSED FAILED  am180x-evm FAILED SKIPPED  omap5-evm PASSED FAILED
> > dra7xx-evm PASSED FAILED  keystone-evm FAILED SKIPPED  beagleboard PASSED
> > FAILED  beaglebone PASSED SKIPPED  pandaboard PASSED SKIPPED
> >
> > These builds were performed using the build-oesdk.sh script at:
> >
> > git://arago-project.org/git/projects/tisdk-build-scripts.git
> >
> > The configuration file passed to this script had the contents:
> >
> > MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID
> > SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER
> > FS_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
> > TISDK_VERSION="2014.03"
> > MACHINES="am335x-evm am37x-evm am3517-evm am180x-evm omap5-evm dra7xx-evm
> > keystone-evm beagleboard beaglebone pandaboard"
> > NUM_ARM9_BUILDS="1"
> > NUM_CORTEX_BUILDS="2"
> > BUILD_ID="`date +build-%F_%H-%M-%S`"
> > SCRIPTS_ROOT="$PWD"
> > BUILD_ROOT="/home/jenkins/distroless-build"
> > TEST_ROOT="$BUILD_ROOT/testing"
> > PACKAGE_ROOT="$BUILD_ROOT/packaging"
> > DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
> > FS_FILTER="core-image-minimal-"
> > FS_IMAGE_TYPE="tar.gz"
> > NFS_ROOT="/home/jenkins/nfs-root"
> > SOURCE_DIR="${BUILD_ROOT}/sources"
> > CLEAN_BUILD="false"
> > CLEAN_ALL="false"
> > CONFIG_FILE="${BUILD_ROOT}/configs/distroless-meta-ti-config.txt"
> > LOG_DIR="${BUILD_ROOT}/log-files"
> > DL_DIR="/OE/downloads"
> > INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"
> > TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
> > TEST_SCRIPTS_TGT="home/root/test-scripts"
> > TEST_LOCAL_IFACE="eth1"
> > OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
> > OPENTEST_TEE_IP="10.218.102.142"
> > OPENTEST_HW_CAP="linux_tigt_farm"
> > RUN_BUILD_TESTS="true"
> > STAF_ROOT="/usr/local/staf"
> > SKIP_TEST_FAILURES="false"
> > PRODUCTIZE_SDK="false"
> > BITBAKE_COMMAND="core-image-minimal"
> > RESULTS_CONFIG_COMMENTS="false"
> > BACKUP_RESULTS="/home/jenkins/jobs/distroless-meta-ti-nightly/workspace"
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >

