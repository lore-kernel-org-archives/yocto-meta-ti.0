Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0421DC7EE2E
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 18:58:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2079.1685127517788417586
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 11:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B2B1F40C24;
	Fri, 26 May 2023 18:58:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztQQaNQwp0ah; Fri, 26 May 2023 18:58:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 879D340ACD;
	Fri, 26 May 2023 18:58:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 84DFD16392A; Fri, 26 May 2023 14:57:48 -0400 (EDT)
Date: Fri, 26 May 2023 14:57:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] check-layer failures for meta-ti
Message-ID: <20230526185748.GE9226@denix.org>
References: <202305021517546e066d50@mail.local>
 <20230502194743.GD9226@denix.org>
 <202305111450394ec6a4fb@mail.local>
 <20230511153603.GX9226@denix.org>
 <2023052210025257f03d87@mail.local>
 <20230526182211e8b9af02@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526182211e8b9af02@mail.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 18:58:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16608

On Fri, May 26, 2023 at 08:22:11PM +0200, Alexandre Belloni wrote:
> This still fails:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1369/steps/19/logs/stdio
> 
> Should we stop testing kirkstone for meta-ti?

The fix was already submitted few days ago:
https://patchwork.yoctoproject.org/project/ti/patch/20230522181143.713064-1-denis@denix.org/

I see it is marked as Accepted, but is not merged to kirkstone...

Ryan,

Did you miss merging it or are there any issues with it?

-- 
Denys


> Also, new failure:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1370/steps/20/logs/stdio
> 
> ERROR: ExpansionError during parsing /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbake/lib/bb/data_smart.py", line 460, in DataSmart.expandWithRefs(s='${@bb.fetch2.get_srcrev(d)}', varname='SRCPV'):
>                      try:
>     >                    s = __expand_python_regexp__.sub(varparse.python_sub, s)
>                      except SyntaxError as e:
>   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbake/lib/bb/data_smart.py", line 150, in VariableParse.python_sub(match=<re.Match object; span=(0, 27), match='${@bb.fetch2.get_srcrev(d)}'>):
>                          self.contains[k].update(parser.contains[k])
>     >            value = utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d})
>                  return str(value)
>   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbake/lib/bb/utils.py", line 434, in better_eval(source=<code object <module> at 0x7ff4056a9b60, file "Var <SRCPV>", line 1>, locals={'d': <bb.data_smart.DataSmart object at 0x7ff4055ce7d0>}, extraglobals={'d': <bb.data_smart.DataSmart object at 0x7ff4055ce7d0>}):
>                  ctx[g] = extraglobals[g]
>     >    return eval(source, ctx, locals)
>      
>   File "Var <SRCPV>", line 1, in <module>
>   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbake/lib/bb/fetch2/__init__.py", line 784, in get_srcrev(d=<bb.data_smart.DataSmart object at 0x7ff4055ce7d0>, method_name='sortable_revision'):
>          if not scms:
>     >        raise FetchError("SRCREV was used yet no valid SCM was found in SRC_URI")
>      
> bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher failure: SRCREV was used yet no valid SCM was found in SRC_URI
> The variable dependency chain for the failure is: SRCPV -> KERNEL_LOCALVERSION -> do_configure
> 
> On 22/05/2023 12:02:54+0200, Alexandre Belloni wrote:
> > Hello,
> > 
> > there is a remaining issue:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1363/steps/19/logs/stdio
> > 
> > AssertionError: Adding layer meta-ti-bsp changed signatures.
> > 10 signatures changed, initial differences (first hash before, second after):
> >    optee-client:do_prepare_recipe_sysroot: d05547a4e057b50bff1357add7383c39c968542c7ca5027c41cd0e073196ac56 -> 8148d8a68b8570d0e1cd0d5fc2d790ab685c45a8beb18e62f227153a790b1198
> >       bitbake-diffsigs --task optee-client do_prepare_recipe_sysroot --signature d05547a4e057b50bff1357add7383c39c968542c7ca5027c41cd0e073196ac56 8148d8a68b8570d0e1cd0d5fc2d790ab685c45a8beb18e62f227153a790b1198
> >       NOTE: Starting bitbake server...
> >       runtaskdeps changed:
> >       ['cmake/cmake-native_3.22.3.bb:do_populate_sysroot gcc/gcc-cross_11.3.bb:do_populate_sysroot gcc/gcc-runtime_11.3.bb:do_populate_sysroot glibc/glibc_2.35.bb:do_populate_sysroot ninja/ninja_1.10.2.bb:do_populate_sysroot:virtual:native optee/optee-client_3.16.0.bb:do_fetch', +pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native, 'pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot']
> >       Number of task dependencies changed
> >       Dependency on task pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native was added with hash cf8a9ff6ed2d492aeeeeeb3972365104425b5424377cf5e4a4fc76bb53a4f628
> > 
> > On 11/05/2023 11:36:03-0400, Denys Dmytriyenko wrote:
> > > On Thu, May 11, 2023 at 04:50:39PM +0200, Alexandre Belloni wrote:
> > > > Hello,
> > > > 
> > > > Did you make any progress? The plan is to disable testing meta-ti next
> > > > week if this isn't fixed by then.
> > > 
> > > Yes, I have necessary patches I'm about to send out.
> > > 
> > > 
> > > > On 02/05/2023 15:47:43-0400, Denys Dmytriyenko wrote:
> > > > > On Tue, May 02, 2023 at 05:17:54PM +0200, Alexandre Belloni via lists.yoctoproject.org wrote:
> > > > > > Hello,
> > > > > > 
> > > > > > meta-ti is currently failing check-layer-nightly:
> > > > > 
> > > > > Yeah, I think I know what's going on and it's a bit more complicated... I'll 
> > > > > take a look at it.
> > 
> > -- 
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

