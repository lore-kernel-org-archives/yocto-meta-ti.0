Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DBEDE00B36; Tue, 19 Jan 2016 12:05:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DEAR_SOMETHING,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CE1CE00A92
	for <meta-ti@yoctoproject.org>; Tue, 19 Jan 2016 12:05:43 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0JK5fqF007403;
	Tue, 19 Jan 2016 14:05:41 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0JK5fHw000969;
	Tue, 19 Jan 2016 14:05:41 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 Jan 2016 14:05:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0JK5eOf019075;
	Tue, 19 Jan 2016 14:05:40 -0600
Date: Tue, 19 Jan 2016 15:05:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <winiston@futuraautomation.com>
Message-ID: <20160119200524.GG4223@edge>
References: <010D464DD7F94DAB8203AA5BF850771E@RD3>
	<CAMKF1sqNBo_a-TCoNE7qULy_JdGaDp7Kx8QqotYa0M_UpUV6zQ@mail.gmail.com>
	<B0C19B9E19864092A51969B8122A1C7E@RD3>
MIME-Version: 1.0
In-Reply-To: <B0C19B9E19864092A51969B8122A1C7E@RD3>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: Re: Regarding Texas AM437x with yocto project
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
X-List-Received-Date: Tue, 19 Jan 2016 20:05:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

You'd need to add meta-ti layer into your OpenEmbedded/Yocto Project setup and 
build for am437x-evm machine.

-- 
Denys


On Tue, Jan 19, 2016 at 05:21:03PM +0530, winiston@futuraautomation.com wrote:
> Dear Khem Raj,
> Thanks for your mail. I followed the yocto project documentation.
> Now I am able to build the embedded linux for x86 system using poky
> 14.0.
> But I want  to build embedded linux for ARM based AM437x (Texas
> ).How do I use AM437x 's BSP and uboot  for this build ?. What are
> the changes needs to be done?
> 
> System configuration :
> Host System   :  Ubuntu 14.04.3
> Target system           : AM437x ( TI based)
> Note : I have downloaded AM437x  BSP from TI website. I have the
> uboot for the same. How do II  make use of it?
> 
> 
> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
> 
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291
> -----Original Message----- From: Khem Raj
> Sent: Tuesday, January 19, 2016 11:12 AM
> To: winiston@futuraautomation.com
> Cc: yocto texas
> Subject: Re: [meta-ti] Regarding Texas AM437x with yocto project
> 
> On Mon, Jan 18, 2016 at 8:38 PM,  <winiston@futuraautomation.com> wrote:
> >Dear Sir/Madam,
> >
> >I plan to use Yocto project in our new project. Our development system is
> >Texas based AM437X.  I am new to yocto project. How do I start the
> >project?
> >Note : We are keen to develop embedded linux with navit
> >(Navigation software
> >).
> >
> 
> There are good documentation and tutorials
> 
> e.g.
> 
> https://www.yoctoproject.org/documentation
> https://www.yoctoproject.org/tools-resources/videos
> https://www.yoctoproject.org/tools-resources/training
> https://www.yoctoproject.org/tools-resources/presentations
> 
> >Regards,
> >Winiston.P
> >Futura Automation Pvt Ltd.
> >
> >Ph :91-80-28375290 / 28375295
> >Fax :91-80-28375291
> >
> >
> >--
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> >
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

