Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED224E00741
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2013 11:58:52 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2KIvmK4002930;
	Wed, 20 Mar 2013 13:57:48 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2KIvmr9016760;
	Wed, 20 Mar 2013 13:57:48 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Mar 2013 13:57:47 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2KIvl9g016205;
	Wed, 20 Mar 2013 13:57:47 -0500
Date: Wed, 20 Mar 2013 14:57:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130320185747.GY32759@edge>
References: <20130319172138.GQ32759@edge> <5148A9B4.5060702@comcast.net>
	<20130319182747.GH14761@denix.org> <5149C666.7040306@comcast.net>
	<20130320151759.GP14761@denix.org> <5149F665.9090204@comcast.net>
	<20130320175415.GW32759@edge> <5149FD74.3030906@comcast.net>
	<20130320182722.GX32759@edge>
	<alpine.DEB.2.02.1303201441410.28378@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1303201441410.28378@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Is this the correct list for AM3517 EVM questions?
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
X-List-Received-Date: Wed, 20 Mar 2013 18:58:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 20, 2013 at 02:45:17PM -0400, Robert P. J. Day wrote:
> On Wed, 20 Mar 2013, Denys Dmytriyenko wrote:
> 
> ... snip ...
> 
> > If you are using poky-danny as a base, you need to use "danny"
> > branch of meta-ti to match the versions.
> 
>   i ordered that very AM3517 exp kit this morning and, while it's
> in transit, i'm building a core-image-minimal for it. should i expect
> success if i use the absolute latest "git pull"s of everything?
> 
>   i'm aware of the recipe masking issue and the mesa-dri version thing
> so i won't trip over that. so far, the "fetchall" worked and i'm
> currently on "running tasks (191 of 1591)" of the build itself.
> 
>   is there any reason to think this shouldn't finish? thanks.

http://article.gmane.org/gmane.linux.embedded.yocto.meta-ti/1661

-- 
Denys

