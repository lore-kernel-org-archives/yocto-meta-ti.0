Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6850BE009E6; Mon,  6 Jul 2015 10:07:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15199E007A3
	for <meta-ti@yoctoproject.org>; Mon,  6 Jul 2015 10:07:28 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t66H7QJ1010060
	for <meta-ti@yoctoproject.org>; Mon, 6 Jul 2015 12:07:27 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t66H7OCk032742
	for <meta-ti@yoctoproject.org>; Mon, 6 Jul 2015 22:37:25 +0530
Received: from [172.22.218.146] (172.22.218.146) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 6 Jul 2015 22:37:11 +0530
Message-ID: <559AB5BF.705@ti.com>
Date: Mon, 6 Jul 2015 22:37:11 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1436169077-6013-1-git-send-email-a0393906@ti.com>
	<20150706152119.GA9792@edge>
In-Reply-To: <20150706152119.GA9792@edge>
X-Originating-IP: [172.22.218.146]
Cc: meta-ti@yoctoproject.org
Subject: Re: [daisy, master] ipumm-fw: Update download path and checksum
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
X-List-Received-Date: Mon, 06 Jul 2015 17:07:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 06-Jul-15 8:51 PM, Denys Dmytriyenko wrote:
> On Mon, Jul 06, 2015 at 01:21:17PM +0530, Karthik Ramanan wrote:
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb |   10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
>> index 2e43584..821a502 100644
>> --- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
>> +++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
>> @@ -9,17 +9,17 @@ python __anonymous() {
>>   DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
>>   LICENSE = "TI-TSPA"
>>
>> -LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=caa45d993ac010abe2fd319f6613bc26"
>> +LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=57d49afcca8f1be47b1c4e79aa06b3ba"
>>
>>   COMPATIBLE_MACHINE = "dra7xx"
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>
>>   RDEPENDS_${PN} = "libdce"
>>
>> -SRC_URI = "http://arago-project.org/files/short-term/misc/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
>> +SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_08_01/exports/
>> ipumm-dra7xx-evm-${PV}.tar.gz;protocol=ftp"
>
> Looks good, but are you sure the protocol ^^^ is correct?

I think both ftp and http work well. I have had it as ftp on the 
meta-glsdk and I can say for sure that its been working fine.

If you want me to change it to http that's fine with me as well.

Let me know.
>
>
>> -SRC_URI[md5sum] = "e770dce63fdf218bb19ceb748d9812c0"
>> -SRC_URI[sha256sum] = "044d49b77560660bdfc29894e669fe8f70dc467c66b4acb49b24722a0799baa1"
>> +SRC_URI[md5sum] = "a1873333e7676ec1b7fcb18fb8b90696"
>> +SRC_URI[sha256sum] = "d583d827191a3772f496145cbf81747e10e7ed553d4653379576ac891019d7fb"
>>
>>   S = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
>>
>> @@ -31,3 +31,5 @@ do_install() {
>>   }
>>
>>   FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
>> +
>> +PR = "r4"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


