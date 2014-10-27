Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47958E00902; Mon, 27 Oct 2014 02:00:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 055AFE0084A
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 02:00:24 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9R90JfT008851;
	Mon, 27 Oct 2014 04:00:20 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9R90Hg6005256;
	Mon, 27 Oct 2014 14:30:18 +0530
Received: from [172.24.157.139] (172.24.157.139) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 27 Oct 2014 14:30:16 +0530
Message-ID: <544E099F.6060001@ti.com>
Date: Mon, 27 Oct 2014 14:30:15 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1413999502-15209-1-git-send-email-denis@denix.org>
	<5447F323.1010701@ti.com> <20141022181708.GP25408@edge>
In-Reply-To: <20141022181708.GP25408@edge>
X-Originating-IP: [172.24.157.139]
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v3] ipumm-fw: Updated ipumm firmware for latest IPC version
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
X-List-Received-Date: Mon, 27 Oct 2014 09:00:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


ACK, this patch can be merged.

On 22-Oct-14 11:47 PM, Denys Dmytriyenko wrote:
> On Wed, Oct 22, 2014 at 11:40:43PM +0530, Karthik Ramanan wrote:
>> On 22-Oct-14 11:08 PM, Denys Dmytriyenko wrote:
>>> From: Karthik Ramanan <a0393906@ti.com>
>>>
>>> * This includes the error handling support.
>>> * Minor bug fixes
>>> * Relax support for entire DRA7xx SOC family to cover AM57x
>>>
>>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>>   ...umm-fw_3.00.04.02.bb => ipumm-fw_3.00.06.00.bb} | 25 +++++++++++-----------
>>>   1 file changed, 12 insertions(+), 13 deletions(-)
>>>   rename recipes-bsp/ipumm-fw/{ipumm-fw_3.00.04.02.bb => ipumm-fw_3.00.06.00.bb} (52%)
>>>
>>> diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
>>> similarity index 52%
>>> rename from recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
>>> rename to recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
>>> index 7f67c39..1cf24cc 100644
>>> --- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
>>> +++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
>>> @@ -6,32 +6,29 @@ python __anonymous() {
>>>           raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
>>>   }
>>>
>>> -DESCRIPTION = "Firmware for IPU "
>>> -
>>> +DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
>>>   LICENSE = "TI-TSPA"
>>> -LIC_FILES_CHKSUM_dra7xx = "file://MMIP-${PV}-Manifest.doc;md5=64ca6f9d7e5243b8a4084eb918a543bc"
>>> +
>>> +LIC_FILES_CHKSUM_dra7xx = "file://MMIP-${PV}-Manifest.doc;md5=8206ccaf28c2932afb5afd9c9575287c"
>>>   LIC_FILES_CHKSUM_omap5-evm = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679ed329c45"
>>>
>>> -COMPATIBLE_MACHINE = "omap-a15"
>>> +COMPATIBLE_MACHINE = "dra7xx|omap5-evm"
>>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>
>>> -# Need to set the PLATFORM variable since now multiple MACHINEs are sharing
>>> -# a common named tarball
>>> -PLATFORM = "UNKNOWN"
>>> -PLATFORM_dra7xx = "dra7xx-evm"
>>> -PLATFORM_omap5-evm = "omap5-evm"
>>> +SRC_URI_dra7xx = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_06_00/exports/ipumm-dra7xx-evm-3.00.06.00.tar.gz;protocol=ftp;name=dra7xx-evm"
>>>
>>> -SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${PLATFORM}-3.00.04.02.tar.gz;protocol=http;name=${PLATFORM}"
>>> +SRC_URI_omap5-evm  = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-3.00.04.02.tar.gz;protocol=http;name=${MACHINE}"
>>>
>>>   # DRA7xx checksums
>>> -SRC_URI[dra7xx-evm.md5sum] = "da04c03b0fd57901e8283afa80f81379"
>>> -SRC_URI[dra7xx-evm.sha256sum] = "0b26fd13f9c318b52c18b9bff56862ef1f58a768b19285b87c035e65bc828ddc"
>>> +SRC_URI[dra7xx-evm.md5sum] = "8e1ae40eb10d631318d001463fa11d79"
>>> +SRC_URI[dra7xx-evm.sha256sum] = "30c275146c34d11dbc2dfd568f0bbc3098a13cd981eee8a7a9766cb07d2f1ca5"
>>
>> Had another look. Would this work, dra7xx-evm?
>
> Right, SRC_URI above sets the name=dra7xx-evm.

I verified that this works fine.

>
>
>>>   # OMAP5 checksums
>>>   SRC_URI[omap5-evm.md5sum] = "1572073ebd4f6d127c4e8cf47d270b6a"
>>>   SRC_URI[omap5-evm.sha256sum] = "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da22ec0d5beaa5cc65"
>>>
>>> -S = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
>>> +S_dra7xx = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
>>> +S_omap5-evm = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
>>>
>>>   TARGET_dra7xx = "dra7-ipu2-fw.xem4"
>>>   TARGET_omap5-evm = "ducati-m3-core0.xem3"
>>> @@ -42,3 +39,5 @@ do_install() {
>>>   }
>>>
>>>   FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
>>> +
>>> +PR = "r1"
>>>
>>


