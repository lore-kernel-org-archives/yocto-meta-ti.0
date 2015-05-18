Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE8F1E009D8; Mon, 18 May 2015 12:00:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FCB8E0094C
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:00:47 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4IJ0kwd005057
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 14:00:46 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IJ0j6L009429
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 14:00:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 May 2015 14:00:45 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IJ0cWX001729;
	Mon, 18 May 2015 14:00:41 -0500
Message-ID: <555A36D5.7000502@ti.com>
Date: Mon, 18 May 2015 15:00:37 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1431970376-24163-1-git-send-email-j-stiffler@ti.com>
	<1431970376-24163-3-git-send-email-j-stiffler@ti.com>
	<20150518174145.GE31845@edge>
In-Reply-To: <20150518174145.GE31845@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/3] gdbserver-c6x: Add version 1.1.0
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
X-List-Received-Date: Mon, 18 May 2015 19:00:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 5/18/2015 1:41 PM, Denys Dmytriyenko wrote:
> On Mon, May 18, 2015 at 01:32:55PM -0400, Jacob Stiffler wrote:
>> * c6x DSP development files required to support remote gdb debugging.
>>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   recipes-devtools/gdbc6x/gdbserver-c6x_git.bb |   46 ++++++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>   create mode 100644 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
>>
>> diff --git a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
>> new file mode 100644
>> index 0000000..d21f03f
>> --- /dev/null
>> +++ b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
>> @@ -0,0 +1,46 @@
>> +DESCRIPTION="TI gdb-server to be used with c6xgdb."
>> +
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = "file://../debian/copyright;md5=82c616b6c8f9c11c46feaaf8f9a11495"
>> +
>> +include gdbc6x.inc
>> +
>> +COMPATIBLE_MACHINE = "dra7xx"
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +PR = "${INC_PR}.0"
>> +
>> +require recipes-ti/includes/ti-paths.inc
>> +
>> +DEPENDS = "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbios ti-xdctools"
>> +
>> +export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
>> +export FC_DIR = "${FC_INSTALL_DIR}"
>> +export TI_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
>> +export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
>> +export XDC_DIR = "${XDC_INSTALL_DIR}"
>> +
>> +PLATFORM = ""
>> +PLATFORM_dra7xx = "DRA7xx_PLATFORM"
>> +
>> +EXTRA_OEMAKE = "PLATFORM=${PLATFORM}"
>> +
>> +PARALLEL_MAKE = ""
>> +
>> +S = "${WORKDIR}/git/gdbserver-c6x/src"
>> +
>> +do_install() {
>> +    install -d ${D}${datadir}/ti/gdbc6x/include
>> +    install -d ${D}${datadir}/ti/gdbc6x/lib
>> +    cp -f ../include/* ${D}${datadir}/ti/gdbc6x/include
>> +    cp -f ../lib/* ${D}${datadir}/ti/gdbc6x/lib
>> +}
>> +
>> +ALLOW_EMPTY_${PN} = "1"
> Why?
>

This recipes only popultaes the -dev and -staticdev packages.

>> +FILES_${PN}-dev += "\
>> +    ${datadir}/ti/gdbc6x \
>> +"
>> +
>> +do_configure[noexec] = "1"
>> +do_qa_configure[noexec] = "1"
> Why?
>
>
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


