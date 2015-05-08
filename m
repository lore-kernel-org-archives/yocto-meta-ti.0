Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 054D2E009D2; Fri,  8 May 2015 10:17:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96EF6E00982
	for <meta-ti@yoctoproject.org>; Fri,  8 May 2015 10:17:45 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t48HHhUs020482;
	Fri, 8 May 2015 12:17:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t48HHh65010929;
	Fri, 8 May 2015 12:17:43 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 8 May 2015 12:17:42 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t48HHgJU003613;
	Fri, 8 May 2015 12:17:42 -0500
Message-ID: <554CEFB6.3070708@ti.com>
Date: Fri, 8 May 2015 13:17:42 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1431094194-11852-1-git-send-email-j-stiffler@ti.com>
	<1431094194-11852-2-git-send-email-j-stiffler@ti.com>
	<22A42254-B630-4E50-BB82-A52F1FA2CD84@gmail.com>
In-Reply-To: <22A42254-B630-4E50-BB82-A52F1FA2CD84@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] ti-xdais: Add version 7.24.00.04
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
X-List-Received-Date: Fri, 08 May 2015 17:17:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I was following the precedent set by existing RTOS packages (See 
recipes-ti/xdais/ti-xdais_6.26.01.03.bb).

These RTOS packages are build only dependencies, and they do not get 
installed into the target filesystem. They are primarily used for 
building firmware.

On 5/8/2015 12:23 PM, Khem Raj wrote:
>> On May 8, 2015, at 7:09 AM, Jacob Stiffler <j-stiffler@ti.com> wrote:
>>
>> +INSANE_SKIP_${PN} = "installed-vs-shipped"
> can this be fixed instead ?


