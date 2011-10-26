Return-Path: <jkridner@beagleboard.org>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FEBEE005BB
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 23:49:20 -0700 (PDT)
Received: by gyh3 with SMTP id 3so1672490gyh.35
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 23:49:19 -0700 (PDT)
Received: by 10.236.184.131 with SMTP id s3mr993606yhm.130.1319611758557;
	Tue, 25 Oct 2011 23:49:18 -0700 (PDT)
Received: from mail-qw0-f48.google.com (mail-qw0-f48.google.com
	[209.85.216.48])
	by mx.google.com with ESMTPS id d63sm1275512yhl.10.2011.10.25.23.49.17
	(version=SSLv3 cipher=OTHER); Tue, 25 Oct 2011 23:49:17 -0700 (PDT)
Received: by qadb14 with SMTP id b14so1684293qad.35
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 23:49:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.73.36 with SMTP id i4mr5053286obv.24.1319611756564; Tue,
	25 Oct 2011 23:49:16 -0700 (PDT)
Received: by 10.182.89.1 with HTTP; Tue, 25 Oct 2011 23:49:16 -0700 (PDT)
In-Reply-To: <82EB1A3D-8AAA-4D21-AEE9-4A66BFF79DD5@dominion.thruhere.net>
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
	<82EB1A3D-8AAA-4D21-AEE9-4A66BFF79DD5@dominion.thruhere.net>
Date: Wed, 26 Oct 2011 02:49:16 -0400
Message-ID: <CA+T6QPnrARwPw4VnkRw1s1V=0qFtYTiE_PJY94K92fLAzj9NRQ@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Koen Kooi <koen@beagleboard.org>, Joel A Fernandes <joelagnel@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable usb-to-serial drivers
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
X-List-Received-Date: Wed, 26 Oct 2011 06:49:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2011 at 1:41 AM, Koen Kooi <koen@beagleboard.org> wrote:
> As a general remark: could you also list the git repo where your patches =
can
> be pulled from? That will save me a lot of email troubles while traveling=
.
>
> Op 26 okt 2011, om 02:13 heeft Joel A Fernandes het volgende geschreven:
>
>> Enable the PL2303 usb-to-serial driver required for serial output
>> from the beaglebone tester.
>>
>> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>> ---
>> .../linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig | =A0 =A03 ++-
>> recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb =A0| =A0 =A02 +-
>> 2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git
>> a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
>> b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
>> index 4b3c21d..478ec3e 100644
>> --- a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfi=
g
>> +++ b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfi=
g
>> @@ -2558,7 +2558,8 @@ CONFIG_USB_LIBUSUAL=3Dy
>> # USB port drivers
>> #
>> # CONFIG_USB_USS720 is not set
>> -# CONFIG_USB_SERIAL is not set
>> +CONFIG_USB_SERIAL=3Dy
>> +CONFIG_USB_SERIAL_PL2303=3Dy
>>
>> #
>> # USB Miscellaneous drivers
>> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
>> b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
>> index bffebea..fbee01f 100644
>> --- a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
>> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
>> @@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX =3D ""
>>
>> BRANCH =3D "master"
>> SRCREV =3D "1955a86594526e18f03c8d62db81119ffc4ccf0f"

I believe this SRCREV is only working for you because it is in your
cache.  Can you confirm with a kernel revision that is currently in
the tree?

Before we launch, I plan to move a clone of the kernel over to
http://github.com/beagleboard.  We simply cannot have these sort of
code management regressions in the build.  Once we can get the PMIC
driver in, I think we make the clone.

>> -MACHINE_KERNEL_PR_append =3D "k+gitr${SRCREV}"
>> +MACHINE_KERNEL_PR_append =3D "l+gitr${SRCREV}"
>>
>> COMPATIBLE_MACHINE =3D "(ti33x)"
>>
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

