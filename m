Return-Path: <pabigot@gmail.com>
Received: from mail-ww0-f42.google.com (mail-ww0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17CDFE0030A
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 04:13:33 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by wwi18 with SMTP id 18so4756063wwi.5
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 04:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=frGIDUZ3+pA/wXqfJasK0OwyaDneAf+8ok4bxFagiz8=;
	b=ePt4AER28IObIpelyKCYZQrJA5VlC8pYVFm/sx1ZwtHZA0vnn12XEi1LIXDH8t5eHS
	AzmVVREKU08CVvrILRL/SZv/WBlh2Lg58SxMUdN80iu34WjgeJ2fk3xasTAg1sQS8dF5
	OwjcA3aFOe7q9KcaNi/RgKg9gWmwzCY7oxitE=
MIME-Version: 1.0
Received: by 10.227.205.132 with SMTP id fq4mr14838140wbb.5.1321272812640;
	Mon, 14 Nov 2011 04:13:32 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.30.200 with HTTP; Mon, 14 Nov 2011 04:13:32 -0800 (PST)
In-Reply-To: <20111114045955.GB15557@denix.org>
References: <CAPOJ94MU-om2UXuHBi+Vfdqr8e_MpWgTnHL__Y0KCELBv1tcpw@mail.gmail.com>
	<20111114045955.GB15557@denix.org>
Date: Mon, 14 Nov 2011 06:13:32 -0600
X-Google-Sender-Auth: ClG30XmSqoSqjj2k1FO4xZX5YRI
Message-ID: <CAPOJ94O6Meq2GuHX-dNrGh_Fv-Rp_Ox5xWOSAAbybdZ9i-P_Lw@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: checksum and path issues building gstreamer-ti
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
X-List-Received-Date: Mon, 14 Nov 2011 12:13:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 13, 2011 at 10:59 PM, Denys Dmytriyenko <denis@denix.org> wrote=
:
> On Sun, Nov 13, 2011 at 09:37:47PM -0600, Peter Bigot wrote:
>> I didn't get an answer to this when I asked it as an aside on the
>> BeagleBoard google group, but just verified that the same problems are
>> present in oe-classic as is in oe-core.
>>
>> The recipe checksums don't match the current downloads:
>>
>> vmserver[52]$ cd Downloads/
>> vmserver[53]$ md5sum ti_cgt_c6000_6.1.17_setup_linux_x86.bin
>> 5ee5c8e573ab0a1ba1249511d4a06c27 ti_cgt_c6000_6.1.17_setup_linux_x86.bin
>> vmserver[54]$ sha256sum ti_cgt_c6000_6.1.17_setup_linux_x86.bin
>> 0cb99e755f5d06a74db22d7c814e4dfd36aa5fcb35eeab01ddb000aef99c08c1
>> ti_cgt_c6000_6.1.17_setup_linux_x86.bin
>>
>> When that's corrected still doesn't work because do_unpack puts the
>> toolchain in =A0/opt/TI/TI_CGT_C6000_6.1.17/ instead of under
>> ${installdir} where ti-paths.inc expects it.
>>
>> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_install: Started
>> ERROR: Logfile of failure stored in:
>> /prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6=
x-1_6_1_17-r4/temp/log.do_install.20024
>> Log data follows:
>> | + do_install
>> | + install -d /prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-=
gnueabi/ti-cgt6x-1_6_1_17-r4/image/usr/share/ti/ti-cgt6x-tree
>> | + cp -pPrf '/prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-g=
nueabi/ti-cgt6x-1_6_1_17-r4/cgt6x_6_1_17/*'
>> /prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6=
x-1_6_1_17-r4/image/usr/share/ti/ti-cgt6x-tree
>> | cp: cannot stat
>> `/prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt=
6x-1_6_1_17-r4/cgt6x_6_1_17/*':
>> No such file or directory
>> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_install: Failed
>>
>> For the version in meta-ti, the LIC_FILES_CHKSUM value was reverted to
>> a wrong checksum when it got moved to the recipe file in commit
>> 7feec8987.
>>
>> Or maybe somebody at TI updated
>> ti_cgt_c6000_6.1.17_setup_linux_x86.bin and the recipe is now broken
>> for anybody who doesn't have a cached copy of a previous release. =A0I'm
>> going to scrap this and move on, but it'd probably be worth verifying
>> that current Angstrom (classic or core) works with current downloads
>> of the codegen tools.
>
> Yes, the binary download of CGT 6.1.17 was updated, unfortunately:
>
> https://lists.yoctoproject.org/pipermail/meta-ti/2011-October/000016.html

Thanks.  Has anybody successfully built with the new binary?  My
experiments suggest correcting the MD5 isn't enough; the installation
process also needs to be modified in non-obvious ways.

Peter

> And we did follow up with CGT team. As one of the options to handle this
> situation more gracefully, I pointed out at the way FSF handled it for wh=
en
> they needed to update all previous releases of binutils - they made avail=
able
> the updated binaries with a suffix.
>
> Anyway, we need to ping them again and see if this can be done similarly =
with
> CGT updates...
>
> Roger/Jason,
>
> Would you mind?
>
> --
> Denys
>

