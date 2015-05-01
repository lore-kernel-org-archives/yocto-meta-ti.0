Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5BEEDE009C9; Fri,  1 May 2015 05:11:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDF18E009BD
	for <meta-ti@yoctoproject.org>; Fri,  1 May 2015 05:11:13 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t41CBB14009782
	for <meta-ti@yoctoproject.org>; Fri, 1 May 2015 07:11:11 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41CBAkU025734
	for <meta-ti@yoctoproject.org>; Fri, 1 May 2015 07:11:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 1 May 2015 07:11:10 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41CBArK011721;
	Fri, 1 May 2015 07:11:10 -0500
Message-ID: <55436D5E.8000900@ti.com>
Date: Fri, 1 May 2015 08:11:10 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1429789331-18918-1-git-send-email-j-stiffler@ti.com>
	<20150423201511.GT25236@edge>
In-Reply-To: <20150423201511.GT25236@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC 0/2] Proposal for enabling CMEM
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
X-List-Received-Date: Fri, 01 May 2015 12:11:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 4/23/2015 4:15 PM, Denys Dmytriyenko wrote:
> On Thu, Apr 23, 2015 at 07:42:09AM -0400, Jacob Stiffler wrote:
>> This is a proposal for adding a CMEM region in the device tree.
>>
>> I wanted to get comments on the following:
>>
>> * implementation of using an inc file to enable this.
>> * Whether the actual configuration belongs in the kernel recipe, or if
>>    this is something that should be handled at the distro or branding
>>    level. (RFC sets the configuration in kernel recipe).
>>      - I have verified that this configuration may also be set in the
>>         branding file using, for example,
>>
>>           CMEM_BASE_pn-linux-ti-staging_omap-a15 = "a0000000"
>>           CMEM_SIZE_pn-linux-ti-staging_omap-a15 = "20000000"
> Hmm, on one hand I don't like this change being so invasive. But on the other
> hand, I'm not sure there's a better cleaner way to do a dts injection like
> that. Let me think about it...

Any thoughts on this yet?

>
>> Jacob Stiffler (2):
>>    linux/cmem.inc: Support reserving memory for CMEM.
>>    linux-ti-staging_3.14: Add CMEM region for omap-a15.
>>
>>   recipes-kernel/linux/cmem.inc                 |   22 ++++++++++++++++++++++
>>   recipes-kernel/linux/linux-ti-staging_3.14.bb |    6 +++++-
>>   recipes-kernel/linux/linux/cmem.dtsi          |   24 ++++++++++++++++++++++++
>>   3 files changed, 51 insertions(+), 1 deletion(-)
>>   create mode 100644 recipes-kernel/linux/cmem.inc
>>   create mode 100644 recipes-kernel/linux/linux/cmem.dtsi
>>
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


