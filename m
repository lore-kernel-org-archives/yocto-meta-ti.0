Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0639E00A01; Mon,  1 Jun 2015 05:55:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5481E00547
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 05:55:54 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51CtrLI001595
	for <meta-ti@yoctoproject.org>; Mon, 1 Jun 2015 07:55:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51CtrbI002426
	for <meta-ti@yoctoproject.org>; Mon, 1 Jun 2015 07:55:53 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 07:55:53 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51CtqSD002366;
	Mon, 1 Jun 2015 07:55:53 -0500
Message-ID: <556C5659.6010106@ti.com>
Date: Mon, 1 Jun 2015 08:55:53 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1432727881-31872-1-git-send-email-j-stiffler@ti.com>
	<20150529200317.GX16418@edge>
In-Reply-To: <20150529200317.GX16418@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] ti-ipc-rtos: Add the TI-RTOS IPC package version 3.35.01.07
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
X-List-Received-Date: Mon, 01 Jun 2015 12:55:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

These files should also be added to the ${PN}-dev package.

On 5/29/2015 4:03 PM, Denys Dmytriyenko wrote:
> Ack
>
> On Wed, May 27, 2015 at 07:58:00AM -0400, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>> * v2 changes:
>>    - Add all files to the main package.
>>
>>   recipes-ti/ipc/ti-ipc-rtos.inc           |   18 ++++++++++++++++++
>>   recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb |    8 ++++++++
>>   2 files changed, 26 insertions(+)
>>   create mode 100644 recipes-ti/ipc/ti-ipc-rtos.inc
>>   create mode 100644 recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb
>>
>> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
>> new file mode 100644
>> index 0000000..fe179f5
>> --- /dev/null
>> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
>> @@ -0,0 +1,18 @@
>> +DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
>> +HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
>> +
>> +LICENSE = "BSD"
>> +
>> +require recipes-ti/includes/ti-paths.inc
>> +require recipes-ti/includes/ti-staging.inc
>> +
>> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${PV}/exports/ipc_${PV}.zip;name=ipczip"
>> +
>> +S = "${WORKDIR}/ipc_${PV}"
>> +
>> +do_install() {
>> +    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
>> +    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
>> +}
>> +
>> +FILES_${PN} += "${IPC_INSTALL_DIR_RECIPE}"
>> diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb b/recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb
>> new file mode 100644
>> index 0000000..4c67c6e
>> --- /dev/null
>> +++ b/recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb
>> @@ -0,0 +1,8 @@
>> +require ti-ipc-rtos.inc
>> +
>> +PV = "3_35_01_07"
>> +
>> +LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
>> +
>> +SRC_URI[ipczip.md5sum] = "9e62e35b8c2d44b1ac5f7ad9554b1a34"
>> +SRC_URI[ipczip.sha256sum] = "006ac780ded0a5fa843397bbde0cb597338dc521544121f697c2efdd80f86314"
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


