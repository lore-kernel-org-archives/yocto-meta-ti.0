Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2139E00AD5; Fri, 21 Apr 2017 07:17:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 931AEE00A30
	for <meta-ti@yoctoproject.org>; Fri, 21 Apr 2017 07:17:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3LEHKFC031199
	for <meta-ti@yoctoproject.org>; Fri, 21 Apr 2017 09:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1492784240;
	bh=Noqmx8iL9tdnkRycoGRQb6kjbPQla/hNv1pL4NoZ/Rg=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=W23lTLcqDbaUeDhk+o3hxW8MBrhBlkmrugCdniFI3LPVUo21cbQVeOohcSEmmgwDL
	ExLzjeydo4wcQvu0IilXHVdfNjO5UHI2rgJFcm3AIOngZiZt5P2BiJ8UM25TpXcnIA
	7/bgYY4X8ybqPpoce+n6NZesaUZ8WeSCYL4s18cQ=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3LEHEhU024921
	for <meta-ti@yoctoproject.org>; Fri, 21 Apr 2017 09:17:15 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3LEHB4k024633
	for <meta-ti@yoctoproject.org>; Fri, 21 Apr 2017 19:47:13 +0530
Received: from [172.22.217.83] (172.22.217.83) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Apr 2017 19:47:10 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1492597804-77037-1-git-send-email-a0393906@ti.com>
	<20170419194309.GI3457@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <58FA1466.8080007@ti.com>
Date: Fri, 21 Apr 2017 19:47:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20170419194309.GI3457@edge>
X-Originating-IP: [172.22.217.83]
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty 1/4] ti-cgt-arm: Include recipes for 16.9.1
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
X-List-Received-Date: Fri, 21 Apr 2017 14:17:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denys,

I have reworked the patches to address all your comments.
Regarding the license, I looked into the ti-cgt-arm folder after 
extraction, it has mention of all these licenses that are captured in 
the recipe.

The v2 of the patch set has been validated with the latest morty/morty-next.

Regards
Karthik

On 20-Apr-17 1:13 AM, Denys Dmytriyenko wrote:
> Please see inline.
>
>
> On Wed, Apr 19, 2017 at 04:00:01PM +0530, Karthik Ramanan wrote:
>> From: Ivan Pang <i-pang@ti.com>
>>
>> Signed-off-by: Ivan Pang <i-pang@ti.com>
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   classes/component_meta.bbclass          | 29 +++++++++++++++++++++++++++++
>>   recipes-ti/devtools/ti-cgt-arm-linux.bb | 26 ++++++++++++++++++++++++++
>>   recipes-ti/devtools/ti-cgt-arm.bb       | 26 ++++++++++++++++++++++++++
>>   recipes-ti/devtools/ti-cgt-arm.inc      | 19 +++++++++++++++++++
>>   4 files changed, 100 insertions(+)
>>   create mode 100644 classes/component_meta.bbclass
>>   create mode 100644 recipes-ti/devtools/ti-cgt-arm-linux.bb
>>   create mode 100644 recipes-ti/devtools/ti-cgt-arm.bb
>>   create mode 100644 recipes-ti/devtools/ti-cgt-arm.inc
>>
>> diff --git a/classes/component_meta.bbclass b/classes/component_meta.bbclass
>> new file mode 100644
>> index 0000000..f2dc754
>> --- /dev/null
>> +++ b/classes/component_meta.bbclass
>> @@ -0,0 +1,29 @@
>> +CM_NAME ?= ""
>> +CM_VERSION ?= ""
>> +CM_ROOT_DIR ?= ""
>> +CM_BINARY ?= ""
>> +CM_DESCRIPTION ?= ""
> I'm not sure what's the purpose of this class and why you are including it
> here...
> I'd suggest you drop it completely.
>
>
>> +do_component_meta() {
>> +    if [ ! -d "${DEPLOY_DIR_IMAGE}" ]
>> +    then
>> +        mkdir -p ${DEPLOY_DIR_IMAGE}
>> +    fi
>> +
>> +    if [ ! -e "${DEPLOY_DIR_IMAGE}/.components_meta" ]
>> +    then
>> +        touch ${DEPLOY_DIR_IMAGE}/.components_meta
>> +    fi
>> +
>> +    # Check if component is already documented in .components_meta
>> +    if ! grep -q "${CM_ROOT_DIR}" ${DEPLOY_DIR_IMAGE}/.components_meta
>> +    then
>> +        # Add component meta information
>> +        echo "${CM_NAME}|${CM_VERSION}|${CM_ROOT_DIR}|${CM_BINARY}|${CM_DESCRIPTION}" >> \
>> +            ${DEPLOY_DIR_IMAGE}/.components_meta
>> +    fi
>> +}
>> +
>> +do_component_meta[lockfiles] = "${DEPLOY_DIR_IMAGE}/component_meta.lock"
>> +
>> +addtask do_component_meta after do_install before do_package
>> diff --git a/recipes-ti/devtools/ti-cgt-arm-linux.bb b/recipes-ti/devtools/ti-cgt-arm-linux.bb
>> new file mode 100644
>> index 0000000..dbb143c
>> --- /dev/null
>> +++ b/recipes-ti/devtools/ti-cgt-arm-linux.bb
>> @@ -0,0 +1,26 @@
>> +include ti-cgt-arm.inc
>> +
>> +BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
>> +BINFILE_MD5 = "aa65a078eeddbf10e8e132a4cf1d58f0"
>> +BINFILE_SHA256 = "a372fd6f7b2608e11326b5c7438311aa37c7fbca0728b158cb9064a0666a8a05"
>> +
>> +do_install() {
>> +    cp ${S}/../${BINFILE} ${S}/${BINFILE_NAME}
> Why do you need this step?
>
> In general, what's the difference between ti-cgt-arm-linux.bb and ti-cgt-arm.bb?
>
> Anyway, this ti-cgt-arm-linux recipe looks superflous to me...
>
>
>> +}
>> +
>> +inherit component_meta
>> +CM_NAME = "TI CGT ARM"
>> +CM_VERSION = "${PV}"
>> +CM_ROOT_DIR = "ti-cgt-arm_${PV}"
>> +CM_DESCRIPTION = "TI ARM code generation tools, including C/C++ compiler, linker, and run-time-support libraries"
>> +CM_BINARY = "${BINFILE_NAME}"
>> +
>> +deltask do_create_srcipk
>> +addtask create_srcipk after do_install before do_populate_sysroot
>> +
>> +CREATE_SRCIPK = "1"
>> +SRCIPK_INSTALL_DIR = "${CM_ROOT_DIR}"
>> +SRCIPK_SRC_DIR = "${S}"
> This should not be here! This has nothing to do with meta-ti!
>
>
>> +INHIBIT_PACKAGE_STRIP = "1"
>> +INHIBIT_SYSROOT_STRIP = "1"
>> diff --git a/recipes-ti/devtools/ti-cgt-arm.bb b/recipes-ti/devtools/ti-cgt-arm.bb
>> new file mode 100644
>> index 0000000..464374d
>> --- /dev/null
>> +++ b/recipes-ti/devtools/ti-cgt-arm.bb
>> @@ -0,0 +1,26 @@
>> +include ti-cgt-arm.inc
>> +
>> +S = "${WORKDIR}/ti-cgt-arm-${PV}"
> May need to be set in .inc file...
>
>
>> +require recipes-ti/includes/ti-unpack.inc
>> +require recipes-ti/includes/ti-staging.inc
>> +require recipes-ti/includes/ti-paths.inc
>> +
>> +TI_BIN_UNPK_ARGS = "--prefix ${S}"
>> +TI_BIN_UNPK_CMDS = ""
>> +
>> +BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
>> +BINFILE_MD5 = "aa65a078eeddbf10e8e132a4cf1d58f0"
>> +BINFILE_SHA256 = "a372fd6f7b2608e11326b5c7438311aa37c7fbca0728b158cb9064a0666a8a05"
>> +
>> +do_install() {
>> +    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
>> +    cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
>> +}
>> +
>> +FILES_${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> +
>> +INHIBIT_PACKAGE_STRIP = "1"
>> +INHIBIT_SYSROOT_STRIP = "1"
>> diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
>> new file mode 100644
>> index 0000000..195d59e
>> --- /dev/null
>> +++ b/recipes-ti/devtools/ti-cgt-arm.inc
>> @@ -0,0 +1,19 @@
>> +DESCRIPTION = "TI ARM Code Generation Tools"
> Use SUMMARY
>
>
>> +HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
>> +LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
> Is this the correct license?
>
>
>> +LIC_FILES_CHKSUM = "file://../${BINFILE};md5=${BINFILE_MD5}"
> This is very incorrect! Please point to the real license file.
>
>
>> +PV = "16.9.1"
>> +PE = "0"
> Drop this - 0 is the default.
>
>
>> +BINFILE_NAME = "cgt_arm_installer"
>> +
>> +SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
>> +
>> +SRC_URI[cgt_arm_installer.md5sum] = "${BINFILE_MD5}"
>> +SRC_URI[cgt_arm_installer.sha256sum] = "${BINFILE_SHA256}"
>> +
>> +FILES_${PN} += "${S}/*"
> ??? What's this?
>
>
>> +INSANE_SKIP_${PN} += "arch staticdev"
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


