Return-Path: <b.hutchman@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCB0BE011C5
	for <meta-ti@yoctoproject.org>; Wed,  9 Oct 2013 11:35:04 -0700 (PDT)
Received: by mail-ea0-f174.google.com with SMTP id z15so623205ead.19
	for <meta-ti@yoctoproject.org>; Wed, 09 Oct 2013 11:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Tj93fc5QJLS4ndwzK434BH0PoM4pAOFVsS85XjOIiEY=;
	b=P8OJK+4Vy1nk4P8kkTawioAnqFPwCPcTkhXb5k4L9i0ipA+CwWKR89lOiih9eQisIT
	8r/lDPbBRbrXBHdRpKB0zqKwSdITAXKbXMVKJpQ9W60ZHjyEr1XL1xtte+JkH5jD9Udw
	7mrwFTt2BSO6tQozAty1NfJmlPx07bp1W2qlhIPPzf4wQuzoMFy0KQcF6LeW5LLeAmRO
	Eu33uJ8mj4PvMuVYcUvXc44yBc5bNwa6HmlVnhySQGdof5QO5G/HSMh84IL9tD6had4x
	PYMi+gnOs5b7gPrUxqbjtZPzRBQnBqE77k3XpQdfU6N361jHrKeqOtTbgIHCFaaiiRwS
	zSng==
MIME-Version: 1.0
X-Received: by 10.14.95.137 with SMTP id p9mr4800497eef.73.1381343703412; Wed,
	09 Oct 2013 11:35:03 -0700 (PDT)
Received: by 10.223.144.205 with HTTP; Wed, 9 Oct 2013 11:35:03 -0700 (PDT)
In-Reply-To: <20131009180902.GB15357@edge>
References: <CAFZh4h9H3bTQveLafJY-3rCz-qy=dqhVq36CTqFt4RCPqJWDcQ@mail.gmail.com>
	<20131009180902.GB15357@edge>
Date: Wed, 9 Oct 2013 14:35:03 -0400
Message-ID: <CAFZh4h-js9LVTCbWXYp3q7zU9QfSNncGDUPtw3uj1dkrYLvHhw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Kernel recipe that works with OECore + meta-ti fails with Poky + meta-ti
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
X-List-Received-Date: Wed, 09 Oct 2013 18:35:07 -0000
Content-Type: multipart/alternative; boundary=001a11c3e86cc1451504e85324ef

--001a11c3e86cc1451504e85324ef
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 9, 2013 at 2:09 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> I have 2 questions:
>
> 1. Which bitbake you use when building oe-core+meta-ti? Since Poky comes
> with
> own copy of bitbake, you may want to compare them.
>
> 2. Not that it would affect packaging, but where in bblayer.conf did you
> add
> meta-ti?
>
> And one more suggestion - you may want to compare classes between oe-core
> and
> poky/meta to see if there are any big differences, especially in the
> packaging
> area...
>
> --
> Denys
>

Hey Denys,

I'll look up the versions here in a sec.  I'm about to kill a build that
has been running for about 3hrs stuck again on just:

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
Currently 1 running tasks (1633 of 2770):
0: linux-ti81xx-psp-2.6.37-r0 do_package (pid 11284)

I researched some of the error messages I got last time and discovered the
SKIP_FILEDEPS flag so I put that in my linux-ti81xx-psp_2.6.37.bb recipe to
see if that would maybe make a difference.  So far when I look at
log.do_package it has done:

DEBUG: Executing python function sstate_task_prefunc
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing python function do_package
DEBUG: Executing python function package_get_auto_pr
DEBUG: Python function package_get_auto_pr finished
DEBUG: Executing python function perform_packagecopy
DEBUG: Python function perform_packagecopy finished
DEBUG: Executing python function split_and_strip_files
DEBUG: Python function split_and_strip_files finished
DEBUG: Executing python function fixup_perms
DEBUG: Python function fixup_perms finished
DEBUG: Executing python function split_kernel_packages
DEBUG: Python function split_kernel_packages finished
DEBUG: Executing python function split_kernel_module_packages
DEBUG: Python function split_kernel_module_packages finished
DEBUG: Executing python function package_do_split_locales
DEBUG: No locale files in this package
DEBUG: Python function package_do_split_locales finished
DEBUG: Executing python function populate_packages

... but it has been stuck there for quite a while and I think something is
probably dead again.  I do a ps and see some decafbad so that probably
isn't good ... and I've been getting plenty of caffeine today :)

hutch@neo:~/yocto_master_wcs_10_4_2013/poky/meta-ti/recipes-kernel/linux$
ps aux | grep -i wcs
hutch    11198  0.0  1.0 140408 82788 pts/3    S+   11:02   0:08 python
/home/hutch/yocto_master_wcs_10_4_2013/poky/bitbake/bin/bitbake
core-image-wcs
hutch    11199  0.0  0.1 179204 14960 pts/3    Sl+  11:02   0:00 python
/home/hutch/yocto_master_wcs_10_4_2013/poky/bitbake/bin/bitbake
core-image-wcs
hutch    11206  3.0  3.7 414052 305136 pts/3   Sl+  11:02   6:08 python
/home/hutch/yocto_master_wcs_10_4_2013/poky/bitbake/bin/bitbake
core-image-wcs
hutch    11280  0.0  1.5 161308 123588 pts/3   S+   11:03   0:02 python
/home/hutch/yocto_master_wcs_10_4_2013/poky/bitbake/bin/bitbake-worker
decafbad
hutch    11282  0.0  1.5 163604 123760 pts/3   S+   11:03   0:03 python
/home/hutch/yocto_master_wcs_10_4_2013/poky/bitbake/bin/bitbake-worker
decafbad
hutch    11284 83.2 13.6 1163748 1121848 pts/3 R    11:03 169:13 python
/home/hutch/yocto_master_wcs_10_4_2013/poky/bitbake/bin/bitbake-worker
decafbad
hutch    11286  9.9 13.7 1138824 1130740 ?     Ss   11:03  20:09
/home/hutch/yocto_master_wcs_10_4_2013/poky/build/tmp/sysroots/x86_64-linux/usr/bin/pseudo
-d
hutch    11696  0.0  0.0   7828   860 pts/20   S+   14:26   0:00 grep -i wcs

--001a11c3e86cc1451504e85324ef
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Oct 9, 2013 at 2:09 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
I have 2 questions:<br>
<br>
1. Which bitbake you use when building oe-core+meta-ti? Since Poky comes wi=
th<br>
own copy of bitbake, you may want to compare them.<br>
<br>
2. Not that it would affect packaging, but where in bblayer.conf did you ad=
d<br>
meta-ti?<br>
<br>
And one more suggestion - you may want to compare classes between oe-core a=
nd<br>
poky/meta to see if there are any big differences, especially in the packag=
ing<br>
area...<br>
<br>
--<br>
Denys<br></blockquote></div><br></div><div class=3D"gmail_extra">Hey Denys,=
<br><br></div><div class=3D"gmail_extra">I&#39;ll look up the versions here=
 in a sec.=A0 I&#39;m about to kill a build that has been running for about=
 3hrs stuck again on just:<br>
<br>NOTE: Preparing runqueue<br>NOTE: Executing SetScene Tasks<br>NOTE: Exe=
cuting RunQueue Tasks<br>Currently 1 running tasks (1633 of 2770):<br>0: li=
nux-ti81xx-psp-2.6.37-r0 do_package (pid 11284)<br><br></div><div class=3D"=
gmail_extra">
I researched some of the error messages I got last time and discovered the =
SKIP_FILEDEPS flag so I put that in my  <a href=3D"http://linux-ti81xx-psp_=
2.6.37.bb" target=3D"_blank">linux-ti81xx-psp_2.6.37.bb</a> recipe to see i=
f that would maybe make a difference.=A0 So far when I look at log.do_packa=
ge it has done:<br>
<br>DEBUG: Executing python function sstate_task_prefunc<br>DEBUG: Python f=
unction sstate_task_prefunc finished<br>DEBUG: Executing python function do=
_package<br>DEBUG: Executing python function package_get_auto_pr<br>DEBUG: =
Python function package_get_auto_pr finished<br>
DEBUG: Executing python function perform_packagecopy<br>DEBUG: Python funct=
ion perform_packagecopy finished<br>DEBUG: Executing python function split_=
and_strip_files<br>DEBUG: Python function split_and_strip_files finished<br=
>
DEBUG: Executing python function fixup_perms<br>DEBUG: Python function fixu=
p_perms finished<br>DEBUG: Executing python function split_kernel_packages<=
br>DEBUG: Python function split_kernel_packages finished<br>DEBUG: Executin=
g python function split_kernel_module_packages<br>
DEBUG: Python function split_kernel_module_packages finished<br>DEBUG: Exec=
uting python function package_do_split_locales<br>DEBUG: No locale files in=
 this package<br>DEBUG: Python function package_do_split_locales finished<b=
r>
DEBUG: Executing python function populate_packages<br><br></div><div class=
=3D"gmail_extra">... but it has been stuck there for quite a while and I th=
ink something is probably dead again.=A0 I do a ps and see some decafbad so=
 that probably isn&#39;t good ... and I&#39;ve been getting plenty of caffe=
ine today :)<br>
<br>hutch@neo:~/yocto_master_wcs_10_4_2013/poky/meta-ti/recipes-kernel/linu=
x$ ps aux | grep -i wcs<br>hutch=A0=A0=A0 11198=A0 0.0=A0 1.0 140408 82788 =
pts/3=A0=A0=A0 S+=A0=A0 11:02=A0=A0 0:08 python /home/hutch/yocto_master_wc=
s_10_4_2013/poky/bitbake/bin/bitbake core-image-wcs<br>
hutch=A0=A0=A0 11199=A0 0.0=A0 0.1 179204 14960 pts/3=A0=A0=A0 Sl+=A0 11:02=
=A0=A0 0:00 python /home/hutch/yocto_master_wcs_10_4_2013/poky/bitbake/bin/=
bitbake core-image-wcs<br>hutch=A0=A0=A0 11206=A0 3.0=A0 3.7 414052 305136 =
pts/3=A0=A0 Sl+=A0 11:02=A0=A0 6:08 python /home/hutch/yocto_master_wcs_10_=
4_2013/poky/bitbake/bin/bitbake core-image-wcs<br>
hutch=A0=A0=A0 11280=A0 0.0=A0 1.5 161308 123588 pts/3=A0=A0 S+=A0=A0 11:03=
=A0=A0 0:02 python /home/hutch/yocto_master_wcs_10_4_2013/poky/bitbake/bin/=
bitbake-worker decafbad<br>hutch=A0=A0=A0 11282=A0 0.0=A0 1.5 163604 123760=
 pts/3=A0=A0 S+=A0=A0 11:03=A0=A0 0:03 python /home/hutch/yocto_master_wcs_=
10_4_2013/poky/bitbake/bin/bitbake-worker decafbad<br>
hutch=A0=A0=A0 11284 83.2 13.6 1163748 1121848 pts/3 R=A0=A0=A0 11:03 169:1=
3 python /home/hutch/yocto_master_wcs_10_4_2013/poky/bitbake/bin/bitbake-wo=
rker decafbad<br>hutch=A0=A0=A0 11286=A0 9.9 13.7 1138824 1130740 ?=A0=A0=
=A0=A0 Ss=A0=A0 11:03=A0 20:09 /home/hutch/yocto_master_wcs_10_4_2013/poky/=
build/tmp/sysroots/x86_64-linux/usr/bin/pseudo -d<br>
hutch=A0=A0=A0 11696=A0 0.0=A0 0.0=A0=A0 7828=A0=A0 860 pts/20=A0=A0 S+=A0=
=A0 14:26=A0=A0 0:00 grep -i wcs<br></div><div class=3D"gmail_extra"><br></=
div></div>

--001a11c3e86cc1451504e85324ef--
