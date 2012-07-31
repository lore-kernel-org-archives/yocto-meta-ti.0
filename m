Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68124E0027B
	for <meta-ti@yoctoproject.org>; Tue, 31 Jul 2012 13:10:52 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6VKAmmS030593;
	Tue, 31 Jul 2012 15:10:48 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6VKAmZu007374;
	Tue, 31 Jul 2012 15:10:48 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 31 Jul 2012 15:10:48 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q6VKAm2U020601;
	Tue, 31 Jul 2012 15:10:48 -0500
Date: Tue, 31 Jul 2012 16:10:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Tim Verstraete <Tim.Verstraete@medecbenelux.be>
Message-ID: <20120731201047.GB21245@edge>
References: <4439C3C0562087488F139C696CD862A72C188D@SBS-MEDEC.medecbenelux.local>
MIME-Version: 1.0
In-Reply-To: <4439C3C0562087488F139C696CD862A72C188D@SBS-MEDEC.medecbenelux.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [HOB] issue
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
X-List-Received-Date: Tue, 31 Jul 2012 20:10:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 31, 2012 at 12:04:37PM +0000, Tim Verstraete wrote:
> Hi,
> 
> When i use the HOB functionality in yocto with the meta-ti, I get an error 
> message after about 5% with no error message in it. I can only press close.
> 
> I use the default layers but I do see that HOB re-arranges them into:
> Poky/meta
> Poky/meta-hob
> Poky/meta-ti
> Poky/meta-yocto
> 
> I see that I can build using the command line so it has to be something with 
> HOB and not necessary something in yocto.

Well, HOB _is_ part of Yocto anyway. While meta-ti may be triggering the issue 
in HOB, you better off reporting it to the main yocto mailing list - feel free 
to copy meta-ti as well.

-- 
Denys

