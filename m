Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 299F4E008E5; Thu, 20 Nov 2014 11:53:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE508E0086F
	for <meta-ti@yoctoproject.org>; Thu, 20 Nov 2014 11:53:03 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAKJr2SW022960
	for <meta-ti@yoctoproject.org>; Thu, 20 Nov 2014 13:53:02 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAKJr1Hw011503
	for <meta-ti@yoctoproject.org>; Thu, 20 Nov 2014 13:53:02 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 20 Nov 2014 13:53:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAKJr1wa026542;
	Thu, 20 Nov 2014 13:53:01 -0600
Date: Thu, 20 Nov 2014 14:53:00 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20141120195300.GD31396@edge>
References: <1416397621-20552-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D375D5C@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D375D5C@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] mmap-lld; Add new recipe for mmap lld
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
X-List-Received-Date: Thu, 20 Nov 2014 19:53:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Chase,

I had pretty much all the same questions before. Please see the discussion we 
had previously on hyplnk-lld patch:

http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/4651

-- 
Denys


On Wed, Nov 19, 2014 at 05:05:51PM +0000, Maupin, Chase wrote:
> 
> diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
> new file mode 100755
> index 0000000..41e46f7
> --- /dev/null
> +++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
> @@ -0,0 +1,40 @@
> +DESCRIPTION = "TI KEYSTONE MMAP driver test binaries "
> +include mmap-lld.inc
> +
> +DEPENDS="common-csl-ip mmap-lld"
> +RDEPENDS_${PN}="uio-module-drv"
> +
> +DEVICELIST = "k2h \
> +              k2k \
> +              k2e \
> +"
> 
> I don't have a fundamental issue with a single  recipe for all devices, but would it be easier to make this per device and then keep a generic binary name?  i.e. a machine specific recipe that installs the binary build for that device into the file system?
> 
> +
> +CHOICELIST = " yes \
> +               no \
> +"
> +
> +do_compile () {
> +	for device in ${DEVICELIST}
> +	do
> +		make -f makefile_armv7 clean \
> +			PDK_INSTALL_PATH="${STAGING_INCDIR}" \
> +			DEVICE="$device" MPAX_SRC_DIR="${S}"
> +		for choice in ${CHOICELIST}
> +		do
> +			make -f makefile_armv7 tests examples \
> +				PDK_INSTALL_PATH=${STAGING_INCDIR} \
> +				DEVICE="$device" MPAX_SRC_DIR="${S}" \
> +				USEDYNAMIC_LIB="$choice"
> +		done
> 
> What is the purpose for both choice options?  Are you expecting users to use both?
> 
> +	done
> +}
> +
> +do_install () {
> +	for device in ${DEVICELIST}
> +	do
> +		make -f makefile_armv7 installbin \
> +		PDK_INSTALL_PATH=${STAGING_INCDIR} \
> +		DEVICE="$device" MPAX_SRC_DIR="${S}" \
> +		INSTALL_BIN_BASE_DIR="${D}/${bindir}"
> +	done
> +}
> diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
> new file mode 100644
> index 0000000..b8a5b32
> --- /dev/null
> +++ b/recipes-bsp/mmap-lld/mmap-lld.inc
> @@ -0,0 +1,16 @@
> +LICENSE = "BSD-3-Clause"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
> 
> Nit pick here but can this checksum go after the LICENSE setting?
> 
> +
> +
> +BRANCH="master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git;destsuffix=git/ti/runtime/mmap;protocol=git;branch=${BRANCH}"
> +# Commit correspond to DEV.MMAP.02.00.00.03 SRCREV = 
> +"601f9284c392f67bb7f69ed1a5df5231a43c3137"
> 
> I would put the SRCREV in the _git file, not in the .inc since you would expect the .inc to be common across all versions.  I guess you are using the .inc to handle the different test vs driver recipes.  Maybe a better idea would be a single recipe that builds both but package the driver as the default package and make a new PACKAGE for the test applications? 
> 
> +
> +PV="2.0.0"
> +PR = "r0"
> +
> +S = "${WORKDIR}/git/ti/runtime/mmap"
> \ No newline at end of file
> diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-lld/mmap-lld_git.bb
> new file mode 100755
> index 0000000..3a56a62
> --- /dev/null
> +++ b/recipes-bsp/mmap-lld/mmap-lld_git.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "TI KEYSTONE mmap driver using Keystone MPAX Programming"
> +include mmap-lld.inc
> +
> +DEPENDS="common-csl-ip"
> +
> +do_compile () {
> +	make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
> +}
> +
> +do_install () {
> +	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} 
> +INSTALL_INC_BASE_DIR=${D}/${includedir} 
> +INSTALL_LIB_BASE_DIR=${D}${libdir}
> +}
> --
> 1.7.9.5
> 
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

