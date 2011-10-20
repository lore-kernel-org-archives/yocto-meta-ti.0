Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75705E006B4
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2011 23:21:37 -0700 (PDT)
Received: by eyh5 with SMTP id 5so3351072eyh.35
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2011 23:21:36 -0700 (PDT)
Received: by 10.223.17.11 with SMTP id q11mr16355269faa.13.1319091695864;
	Wed, 19 Oct 2011 23:21:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b16sm14052731fao.7.2011.10.19.23.21.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 23:21:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAD=GYpYpjUg4M9-7eio56F7uS19=WdZsbEBCpLT+SAbnGDmLDA@mail.gmail.com>
Date: Thu, 20 Oct 2011 08:21:33 +0200
Message-Id: <305F348E-A7E6-4F3B-8364-181C593E6682@dominion.thruhere.net>
References: <1319082770-5589-1-git-send-email-joelagnel@ti.com>
	<a0394de50abd4fa391c362a6be4d46ea@DFLE70.ent.ti.com>
	<CAD=GYpYpjUg4M9-7eio56F7uS19=WdZsbEBCpLT+SAbnGDmLDA@mail.gmail.com>
To: Joel A Fernandes <agnel.joel@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Fernandes,
	Joel A" <joelagnel@ti.com>, "Kridner, Jason" <jdk@ti.com>,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] [PATCH meta-ti] sdcard_image: Copy user.txt/uEnv.txt if it exists in /boot
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
X-List-Received-Date: Thu, 20 Oct 2011 06:21:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 20 okt. 2011, om 08:17 heeft Joel A Fernandes het volgende =
geschreven:

> On Thu, Oct 20, 2011 at 12:40 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> [added meta-ti list]
>>=20
>> Op 20 okt. 2011, om 05:52 heeft Joel A Fernandes het volgende =
geschreven:
>>=20
>>> Pick up uEnv.txt/user.txt U-boot environment files installed in =
/boot
>>=20
>> This doesn't match what the patch does :/
>=20
> Yes it does

"pick up" implies you're adding something new instead of fixing it. =
Please write better commit messages.

>=20
>>=20
>>>=20
>>> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>>> ---
>>> classes/sdcard_image.bbclass |    4 +++-
>>> 1 files changed, 3 insertions(+), 1 deletions(-)
>>>=20
>>> diff --git a/classes/sdcard_image.bbclass =
b/classes/sdcard_image.bbclass
>>> index ed9d779..c535ad2 100644
>>> --- a/classes/sdcard_image.bbclass
>>> +++ b/classes/sdcard_image.bbclass
>>> @@ -86,8 +86,10 @@ IMAGE_CMD_sdimg () {
>>>               suffix=3Dbin
>>>       fi
>>>=20
>>> +     cp -v ${IMAGE_ROOTFS}/boot/{user.txt,uEnv.txt} =
${WORKDIR}/tmp-mnt-boot || true
>>> +
>>>       if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then
>>> -             cp -v =
${IMAGE_ROOTFS}/boot/{u-boot.$suffix,user.txt,uEnv.txt} =
${WORKDIR}/tmp-mnt-boot || true
>>> +             cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} =
${WORKDIR}/tmp-mnt-boot || true
>>=20
>> Your patch is effectively a noop, I don't see the value in applying =
it.
>>=20
>=20
> There is quite a lot of value in applying it.
>=20
> I suggest you try to build an image (cloud9 / ti-hw-bringup) and
> notice that there is no uEnv.txt in the boot partition.

If you're fixing the bug that {1,2,3} will only pick 1, but forget 2,3 =
then user.txt is still broken. If you're saying uboot.suffix is not in =
/boot, we need to fix that. Either way, I'm not supposed to be guessing =
that, you should explain that in the commit message or with comments in =
the code or both.

regards,

Koen=

