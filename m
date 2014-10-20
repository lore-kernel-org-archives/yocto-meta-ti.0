Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F886E00846; Mon, 20 Oct 2014 13:23:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07D36E0080C
	for <meta-ti@yoctoproject.org>; Mon, 20 Oct 2014 13:23:34 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9KKNX9g008865;
	Mon, 20 Oct 2014 15:23:33 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9KKNW8w002461;
	Mon, 20 Oct 2014 15:23:33 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 20 Oct 2014 15:23:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9KKNWqj007487;
	Mon, 20 Oct 2014 15:23:32 -0500
Date: Mon, 20 Oct 2014 16:23:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tank <ankurtank.linux@gmail.com>
Message-ID: <20141020202331.GF25408@edge>
References: <CAFvPE2rtOWNQiKkpgC82k=sop4e2gT_AuHHO7fH3g4C97-tTGg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFvPE2rtOWNQiKkpgC82k=sop4e2gT_AuHHO7fH3g4C97-tTGg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: BBB+Chipsee lcd --- tilcdc 4830e000.lcdc: no encoders/connectors found
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
X-List-Received-Date: Mon, 20 Oct 2014 20:23:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Oct 19, 2014 at 10:11:55PM +0530, Ankur Tank wrote:
> Hi All,
> 
> I am using BBB + Chipseee 7 " inch capacitive lcd and Yocto daisy,
> I am able to boot BBB and daisy but i am not able see anything on LCD.
> I am not even seeing /dev/fb .
> I read some of the TI links and found that there are some changes in the
> LCD controller driver but i am not sure how to accomodate those changes and
> make appropriate devicetree changes.
> I am attaching full boot load and dts file for you reference.

Unless your LCD connects to HDMI, the refernce BSP provided by the Yocto 
Project won't be able to support it. Moreover, this mailing list is for 
meta-ti BSP.

-- 
Denys

