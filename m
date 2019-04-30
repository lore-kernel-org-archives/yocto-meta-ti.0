Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F34DEE00D13; Tue, 30 Apr 2019 16:08:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67D9BE00CEE
	for <meta-ti@yoctoproject.org>; Tue, 30 Apr 2019 16:08:15 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UN8Eie084978
	for <meta-ti@yoctoproject.org>; Tue, 30 Apr 2019 18:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556665694;
	bh=a1b4L+5KFbHuhp3pOrSEx/Jue+J/TLxtc6F3rZvsDiE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YPuzGPK/OAx6VxCz5eDiXng8XRKc1wxohMCkKYj56Efhkxrr/CB54uK/e5WaQ3rs0
	OPiFYPlyoHZ7FaUCuuB7si9l4wn1TQHtcu17rELr8DE9nLNzdFN/vUlDXtGmMY5mAt
	aQUW2/+NNCo/jr7uPKe9q9vPPz3HSJXBVGgxvFTE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UN8En8080729
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 30 Apr 2019 18:08:14 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 30 Apr 2019 18:08:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 30 Apr 2019 18:08:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UN8EKW104567;
	Tue, 30 Apr 2019 18:08:14 -0500
Date: Tue, 30 Apr 2019 19:08:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20190430230814.GA4811@beryl>
References: <20190430215720.27169-1-dmurphy@ti.com>
	<20190430220323.GA4119@beryl>
	<fb5dbb38-f8de-10ae-d92a-c5bf73f5cf81@ti.com>
	<20190430220843.GB4119@beryl>
	<4dd315d2-628a-dd36-c5cc-565d23be90fe@ti.com>
MIME-Version: 1.0
In-Reply-To: <4dd315d2-628a-dd36-c5cc-565d23be90fe@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] ti-linux-firmware: Update am6 prueth firmware
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
X-List-Received-Date: Tue, 30 Apr 2019 23:08:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Apr 30, 2019 at 05:10:58PM -0500, Dan Murphy wrote:
> Denys
> 
> On 4/30/19 5:08 PM, Denys Dmytriyenko wrote:
> > On Tue, Apr 30, 2019 at 05:05:44PM -0500, Dan Murphy wrote:
> >> Denys
> >>
> >> On 4/30/19 5:03 PM, Denys Dmytriyenko wrote:
> >>> ?
> >>>
> >>> On Tue, Apr 30, 2019 at 04:57:18PM -0500, Dan Murphy wrote:
> >>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >>>> ---
> >>>>  recipes-bsp/prueth-fw/prueth-fw-bin_git.bb | 4 ++--
> >>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb b/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
> >>>> index d129620c..60dc0879 100644
> >>>> --- a/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
> >>>> +++ b/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
> >>>> @@ -3,7 +3,7 @@ SUMMARY = "PRU Ethernet firmware for AM65xx"
> >>>>  LICENSE = "TI-TFL"
> >>>>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> >>>>  
> >>>> -PV = "5.1.0.7"
> >>>> +PV = "5.3.0.5"
> >>>>  
> >>>>  CLEANBROKEN = "1"
> >>>>  
> >>>> @@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm"
> >>>>  
> >>>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>>>  
> >>>> -SRCREV = "1e03f08e89bee6d29ffd25782f5ce45b1b4bf1e6"
> >>>> +SRCREV = "534ba03becfa9b39ccbd42b97e091abd94a207e7"
> >>
> >> The AM6 prueth firmware was updated after rc1 tag.
> > 
> > Yes, and the recipe was already uipdated. Don't forget git update.
> > 
> 
> Apparently I did.  I know I pulled new ref's but apparently not into my local branch
> 
> Please ignore this patch

No problem, thanks!


> Dan
> 
> > 
> >> Dan
> >>
> >>>>  BRANCH ?= "ti-linux-firmware"
> >>>>  
> >>>>  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> >>>> -- 
> >>>> 2.21.0.5.gaeb582a983
> >>>>

