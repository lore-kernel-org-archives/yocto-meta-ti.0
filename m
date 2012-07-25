Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D756E00280
	for <meta-ti@yoctoproject.org>; Tue, 24 Jul 2012 22:11:58 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6P5Bu36006044;
	Wed, 25 Jul 2012 00:11:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6P5Bu65007121;
	Wed, 25 Jul 2012 00:11:56 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 25 Jul 2012 00:11:55 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q6P5Bt0k023747;
	Wed, 25 Jul 2012 00:11:55 -0500
Date: Wed, 25 Jul 2012 01:11:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: maniacbug <maniacbug@ymail.com>
Message-ID: <20120725051154.GC28778@edge>
References: <1343187414.7556.YahooMailNeo@web121605.mail.ne1.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <1343187414.7556.YahooMailNeo@web121605.mail.ne1.yahoo.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: omapfbplay depends on libav
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 05:11:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 24, 2012 at 08:36:54PM -0700, maniacbug wrote:
> But where does one find a recipe for libav? I've looked in Angstom and 
> Yocto, but cannot seem to find it.

http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-multimedia/libav


> While I'm at it... I'm looking for a way to play mpeg4 or h.264 from the 
> command line. omapfbplay seems like the best choice. Does anyone have 
> another recommendation?

gstreamer?

-- 
Denys

