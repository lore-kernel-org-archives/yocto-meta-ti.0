Return-Path: <raj.khem@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21394E015FD
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2013 16:18:01 -0700 (PDT)
Received: by mail-ob0-f181.google.com with SMTP id gq1so1325366obb.26
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2013 16:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hbvgCsWfTNlSKgeCGWM7mNMYd4X8xQT2attHaHVuIag=;
	b=jMmeaVX8npFpqYHO0Zwe8YgQMRMMVeYmKwS1WnQWhXPfUtxHcg9C4cstmnOaNB8RQg
	O0/rzkhSUVhA2kzbCscRxnCMOJangRqz9UEwWIMXFq+Gmp/HCih+uj+Mp8/zCfRJz1y7
	n94AGBtfXTGXosXGga9viEiy34Mnas1m2Tf34tnac5eChnXGFS4n/d6Ly3gPx6aja8Wy
	yw/kU3b224RciQ5jzHfdDeun26hZuWIxzwhFjyVdXAHTqV7XKnO8FwONTpd+tlWHlCKM
	q9wbsLGiz6KCxJSA2Ak8Svexndl4hofNdVxOa/bfodOAKBFpk41goVLnYQu1UJAZ7kxh
	kxNg==
MIME-Version: 1.0
X-Received: by 10.60.78.227 with SMTP id e3mr7952453oex.5.1379719080997; Fri,
	20 Sep 2013 16:18:00 -0700 (PDT)
Received: by 10.60.77.41 with HTTP; Fri, 20 Sep 2013 16:18:00 -0700 (PDT)
In-Reply-To: <1hnmpuqwd05i99mkxx408jea.1379715079255@email.android.com>
References: <1379710561-16000-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C5583FF@DFLE08.ent.ti.com>
	<1hnmpuqwd05i99mkxx408jea.1379715079255@email.android.com>
Date: Fri, 20 Sep 2013 16:18:00 -0700
Message-ID: <CAMKF1srsBr00ymSAjEhDuquXuZ8tdeN_cyUc28pTuFM=oKUyxA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Murphy, Dan" <dmurphy@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: bump to 3.12-rc1 with platform-base and PMIC merged
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
X-List-Received-Date: Fri, 20 Sep 2013 23:18:02 -0000
Content-Type: multipart/alternative; boundary=089e0111bca4b6c72904e6d8e10d

--089e0111bca4b6c72904e6d8e10d
Content-Type: text/plain; charset=UTF-8

On Friday, September 20, 2013, Murphy, Dan <dmurphy@ti.com> wrote:
> You should auto rev this branch.  It can change at any hour.  And so much
can be added.
>
it should be used with caution
autorev would impede folks who disable bitbake to fetch from www and use
internal mirror for srcs

> Dan
>
> "Cooper Jr., Franklin" <fcooper@ti.com> wrote:
>
>
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>> Sent: Friday, September 20, 2013 3:56 PM
>> To: meta-ti@yoctoproject.org
>> Cc: Murphy, Dan
>> Subject: [meta-ti] [PATCH] linux-ti-staging: bump to 3.12-rc1 with
platform-base
>> and PMIC merged
>>
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> Cc: Dan Murphy <DMurphy@ti.com>
>> ---
>>  recipes-kernel/linux/linux-ti-staging_git.bb | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-
>> kernel/linux/linux-ti-staging_git.bb
>> index 7d84cc4..694a164 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
>> @@ -31,11 +31,11 @@ S = "${WORKDIR}/git"
>>
>>  BRANCH = "ti-linux-3.12.y"
>>
>> -SRCREV = "b36f4be3de1b123d8601de062e7dbfc904f305fb"
>> -PV = "3.10+3.11-rc6"
>> +SRCREV = "351da8b4c2ff277b2d816a2108ada357a63fadbe"
>> +PV = "3.11+3.12-rc1"
> [Franklin] What does the 3.11+ mean?
>>
>>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
>> rebuild -MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
>> +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
>>
>>  SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-
>> kernel.git;protocol=git;branch=${BRANCH} \
>>             file://defconfig \
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--089e0111bca4b6c72904e6d8e10d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, September 20, 2013, Murphy, Dan &lt;<a href=3D"mailto:dm=
urphy@ti.com">dmurphy@ti.com</a>&gt; wrote:<br>&gt; You should auto rev thi=
s branch. =C2=A0It can change at any hour. =C2=A0And so much can be added.<=
br>&gt;<br>
it should be used with caution<br>autorev would impede folks who disable bi=
tbake to fetch from www and use internal mirror for srcs<br><br>&gt; Dan<br=
>&gt;<br>&gt; &quot;Cooper Jr., Franklin&quot; &lt;<a href=3D"mailto:fcoope=
r@ti.com">fcooper@ti.com</a>&gt; wrote:<br>
&gt;<br>&gt;<br>&gt;&gt; -----Original Message-----<br>&gt;&gt; From: <a hr=
ef=3D"mailto:meta-ti-bounces@yoctoproject.org">meta-ti-bounces@yoctoproject=
.org</a> [mailto:<a href=3D"mailto:meta-ti-">meta-ti-</a><br>&gt;&gt; <a hr=
ef=3D"mailto:bounces@yoctoproject.org">bounces@yoctoproject.org</a>] On Beh=
alf Of Denys Dmytriyenko<br>
&gt;&gt; Sent: Friday, September 20, 2013 3:56 PM<br>&gt;&gt; To: <a href=
=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br>&gt;&g=
t; Cc: Murphy, Dan<br>&gt;&gt; Subject: [meta-ti] [PATCH] linux-ti-staging:=
 bump to 3.12-rc1 with platform-base<br>
&gt;&gt; and PMIC merged<br>&gt;&gt;<br>&gt;&gt; From: Denys Dmytriyenko &l=
t;<a href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt;<br>&gt;&gt;<br>&gt;&=
gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">de=
nys@ti.com</a>&gt;<br>
&gt;&gt; Cc: Dan Murphy &lt;<a href=3D"mailto:DMurphy@ti.com">DMurphy@ti.co=
m</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =C2=A0recipes-kernel/linux/<a href=3D=
"http://linux-ti-staging_git.bb">linux-ti-staging_git.bb</a> | 6 +++---<br>=
&gt;&gt; =C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt;<br>&gt;&gt; diff --git a/recipes-kernel/linux/<a href=3D"http://li=
nux-ti-staging_git.bb">linux-ti-staging_git.bb</a> b/recipes-<br>&gt;&gt; k=
ernel/linux/<a href=3D"http://linux-ti-staging_git.bb">linux-ti-staging_git=
.bb</a><br>
&gt;&gt; index 7d84cc4..694a164 100644<br>&gt;&gt; --- a/recipes-kernel/lin=
ux/<a href=3D"http://linux-ti-staging_git.bb">linux-ti-staging_git.bb</a><b=
r>&gt;&gt; +++ b/recipes-kernel/linux/<a href=3D"http://linux-ti-staging_gi=
t.bb">linux-ti-staging_git.bb</a><br>
&gt;&gt; @@ -31,11 +31,11 @@ S =3D &quot;${WORKDIR}/git&quot;<br>&gt;&gt;<b=
r>&gt;&gt; =C2=A0BRANCH =3D &quot;ti-linux-3.12.y&quot;<br>&gt;&gt;<br>&gt;=
&gt; -SRCREV =3D &quot;b36f4be3de1b123d8601de062e7dbfc904f305fb&quot;<br>&g=
t;&gt; -PV =3D &quot;3.10+3.11-rc6&quot;<br>
&gt;&gt; +SRCREV =3D &quot;351da8b4c2ff277b2d816a2108ada357a63fadbe&quot;<b=
r>&gt;&gt; +PV =3D &quot;3.11+3.12-rc1&quot;<br>&gt; [Franklin] What does t=
he 3.11+ mean?<br>&gt;&gt;<br>&gt;&gt; =C2=A0# Append to the MACHINE_KERNEL=
_PR so that a new SRCREV will cause a<br>
&gt;&gt; rebuild -MACHINE_KERNEL_PR_append =3D &quot;b+gitr${SRCPV}&quot;<b=
r>&gt;&gt; +MACHINE_KERNEL_PR_append =3D &quot;a+gitr${SRCPV}&quot;<br>&gt;=
&gt;<br>&gt;&gt; =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.ti.com=
/ti-linux-kernel/ti-linux-">git.ti.com/ti-linux-kernel/ti-linux-</a><br>
&gt;&gt; kernel.git;protocol=3Dgit;branch=3D${BRANCH} \<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://defconfig \<br>&gt;&gt; --<br>&gt=
;&gt; 1.8.3.2<br>&gt;&gt;<br>&gt;&gt; _____________________________________=
__________<br>&gt;&gt; meta-ti mailing list<br>
&gt;&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a><br>&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-=
ti">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>&gt; ___________=
____________________________________<br>
&gt; meta-ti mailing list<br>&gt; <a href=3D"mailto:meta-ti@yoctoproject.or=
g">meta-ti@yoctoproject.org</a><br>&gt; <a href=3D"https://lists.yoctoproje=
ct.org/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-ti</a=
><br>
&gt;

--089e0111bca4b6c72904e6d8e10d--
