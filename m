Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80DDAE007F7
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 09:42:26 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rBIHgPHf025353;
	Wed, 18 Dec 2013 11:42:25 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBIHgPuK004168;
	Wed, 18 Dec 2013 11:42:25 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 18 Dec 2013 11:42:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBIHgOUB030347;
	Wed, 18 Dec 2013 11:42:24 -0600
Date: Wed, 18 Dec 2013 12:42:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Johnson Thomas <johnsonthomas@nanometrics.ca>
Message-ID: <20131218174223.GT24180@edge>
References: <CAL58Aehin5=s1tCLoonZScAQvq2Hp7nwb8zzc4TBpXTSVWfp+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL58Aehin5=s1tCLoonZScAQvq2Hp7nwb8zzc4TBpXTSVWfp+Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Latest version of Poky compatible with meta-ti
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
X-List-Received-Date: Wed, 18 Dec 2013 17:42:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Dec 18, 2013 at 12:36:29PM -0500, Johnson Thomas wrote:
> Hi all.
> 
> I have a Yocto project consisting of Poky (Danny-8.0.2), meta-ti (tag:
> ti2013.04.00) and a custom BSP layer. I was looking at upgrading the Poky
> version to maybe 9.0 or even 10.0. I was wondering, what is the latest
> version of Poky that is compatible with meta-ti layer?. Also, is it
> recommended to use the "Danny" branch as a stable version for meta-ti layer?

Hi,

Danny branch is quite old and hasn't been updated in long time (although you 
are using an older tag from meta-ti/danny). Currently active branches in 
meta-ti are dylan and master (dora and later). That would correspond to Poky 
releases version 9 and version 10. We are still using Dylan for our stable 
releases, but should be switching to Dora soon. So, you can use either Dylan 
or master from meta-ti, but I won't recommentd staying with Danny.

-- 
Denys

