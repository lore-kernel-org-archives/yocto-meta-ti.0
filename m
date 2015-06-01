Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 463A0E00A3C; Mon,  1 Jun 2015 05:27:25 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C044DE009A3
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 05:27:20 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51CRIWu000936
	for <meta-ti@yoctoproject.org>; Mon, 1 Jun 2015 07:27:18 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51CRIk7006663
	for <meta-ti@yoctoproject.org>; Mon, 1 Jun 2015 07:27:18 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 07:27:18 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51CRHLZ027788;
	Mon, 1 Jun 2015 07:27:18 -0500
Message-ID: <556C4FA5.3020700@ti.com>
Date: Mon, 1 Jun 2015 08:27:17 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1432728947-4837-1-git-send-email-j-stiffler@ti.com>
	<1432728947-4837-2-git-send-email-j-stiffler@ti.com>
	<20150529200544.GZ16418@edge>
In-Reply-To: <20150529200544.GZ16418@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/3] ti-framework-components: Add all files to the main package.
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
X-List-Received-Date: Mon, 01 Jun 2015 12:27:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 5/29/2015 4:05 PM, Denys Dmytriyenko wrote:
> On Wed, May 27, 2015 at 08:15:46AM -0400, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   .../ti-framework-components.inc                    |    3 +++
>>   .../ti-framework-components_2.26.00.01.bb          |    4 +---
>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-ti/framework-components/ti-framework-components.inc b/recipes-ti/framework-components/ti-framework-components.inc
>> index 46f6cfd..b8d3f7c 100644
>> --- a/recipes-ti/framework-components/ti-framework-components.inc
>> +++ b/recipes-ti/framework-components/ti-framework-components.inc
>> @@ -15,3 +15,6 @@ do_install() {
>>       cp -pPrf ${S}/* ${D}${FC_INSTALL_DIR_RECIPE}
>>   }
>>   
>> +INSANE_SKIP_${PN} = "ldflags"
> Are there libraries in the package?
>

DSP libraries are provided in this package.

>> +FILES_${PN} += "${FC_INSTALL_DIR_RECIPE}"
>> diff --git a/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb b/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
>> index 9570678..1ec10b1 100644
>> --- a/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
>> +++ b/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
>> @@ -1,11 +1,9 @@
>>   require ti-framework-components.inc
>>   
>>   PV = "2_26_00_01"
>> -PR = "r1"
>> +PR = "r2"
>>   
>>   LIC_FILES_CHKSUM = "file://framework_components_2_26_00_01_manifest.html;md5=3250f9da7ee72284c07f8dd840400c75"
>>   
>>   SRC_URI[fctarball.md5sum] = "40b51cade2f9ae6e6f6dca73c17065af"
>>   SRC_URI[fctarball.sha256sum] = "3f7a12a51dfe87310828a31518d7ef8f9039e59269c0ca24f74a68433c235048"
>> -
>> -INSANE_SKIP_${PN} = "installed-vs-shipped"
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


