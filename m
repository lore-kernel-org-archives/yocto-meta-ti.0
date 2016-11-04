Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0549E00BBA; Fri,  4 Nov 2016 06:34:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C862E00B62
	for <meta-ti@yoctoproject.org>; Fri,  4 Nov 2016 06:34:46 -0700 (PDT)
Received: by mail-oi0-f66.google.com with SMTP id 128so12607156oih.3
	for <meta-ti@yoctoproject.org>; Fri, 04 Nov 2016 06:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=j4mMPO1HZWaWJ+MFjUf+GhSt8s4gw0up09J1lfL3m4Q=;
	b=xwhhL+Q27p5vtHRxl6MViDltaNZUMI9Ytj8HgxRVGR/b6nH0qBCeSHJW2Qjk5wMDqb
	4hlxTNKaIDOPPBRmWNzhuKnOV0KqaOLAgjxRIAWs8Ihq/JnSkvCjTOSGziW5SrcNcwaN
	l31nq/NWsFp4MeofM2I310W5T8jovaCZUkWLmDgu1nZbLzlsScss5umCFceZC8o791v2
	u6nGEqIGLYZoa7atJ4/u4NrqLZlCp8vtd4fapPszEKCnaGn5tqa+fBjKE51TKTd3Vt30
	iyaP9OIeoez4mUkxLEmkQMD83MoEALsPBhp6JNyZ8UvLNqAf2Paj22QlvdObG9kF87Yd
	2zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=j4mMPO1HZWaWJ+MFjUf+GhSt8s4gw0up09J1lfL3m4Q=;
	b=bcWHA/MFR6a5rGbFT+KlXLOphtvtIXHgLWCgJWgxeJiLDxfbVcPRGd4lHeC0MrpTKc
	fQy5R+u/ZmH3yFXboDBWYgKJlLoR56FYaI9xLgH+RDgaOrTTUkL9TDu6fHB28vZ115nM
	hZ/C8i/28thOZ58LtL/cJWRkmidg5qk4Q3EPtnypO9/UKwEhbNMWxnoZPYr9ih5EktKj
	gaqZ8+qGCuoyKopOy8fI/Oa/2omkKJwNtW9I4S3qVY401TWkcPUVn2EKEGKIenMoCMc4
	S6S+iCeIGTqtYdhPahGweaCBeJuMTPLzch04gwKtSKevOPW+AajyOMiN3mUnFaabeUe/
	1bmA==
X-Gm-Message-State: ABUngvfTd/8CkClG+EfLxcD9UaUFNDJ0L4azZSp/cbq3BMqRhUr/nI5FrrHcJL/gkUI62sV4fi6S/g7yN1v0kA==
X-Received: by 10.36.92.193 with SMTP id q184mr1855534itb.30.1478266483392;
	Fri, 04 Nov 2016 06:34:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.204 with HTTP; Fri, 4 Nov 2016 06:34:13 -0700 (PDT)
In-Reply-To: <1478251939.5248.11.camel@energomera.ru>
References: <1478251939.5248.11.camel@energomera.ru>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 4 Nov 2016 08:34:13 -0500
Message-ID: <CAOCHtYgP2_WNH7o99uGxSFQKAN+vC_734VLWJy9+DTW_+FEGpw@mail.gmail.com>
To: =?UTF-8?B?0KjQsNGA0LjRhdC40L0g0JTQvNC40YLRgNC40Lkg0KHQtdGA0LPQtdC10LLQuNGH?=
	<SharihinDS@energomera.ru>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Unable to build ti-ccsv6-native and other packages
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
X-List-Received-Date: Fri, 04 Nov 2016 13:34:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 4, 2016 at 4:32 AM, =D0=A8=D0=B0=D1=80=D0=B8=D1=85=D0=B8=D0=BD =
=D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=B9 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=
=D0=B5=D0=B2=D0=B8=D1=87
<SharihinDS@energomera.ru> wrote:
> Hi all,
> A few days ago it was announced the release of Yocto 2.2, so I decided to
> rebuild whole distro.
>
> 1. When I started bitbake, I've found that there's no Doxygen package in
> base Yocto/Poky distro, so I've copied one from meta-arago-extras. What's
> the correct way to workaround this issue?
>
> 2. [Main issue] When bitbake tries to build ti-ccsv6-native there is a
> error:
>
> WARNING: ti-ccsv6-native-6.1.3.00034-r0 do_fetch: Failed to fetch URL
> http://install.source.dir.local/CCS6.1.3.00034_linux.tar.gz;name=3Dccsv6,
> attempting MIRRORS if available
> ERROR: ti-ccsv6-native-6.1.3.00034-r0 do_fetch: Fetcher failure: Fetch
> command export
> DBUS_SESSION_BUS_ADDRESS=3D"unix:abstract=3D/tmp/dbus-aH3buan98u,guid=3De=
17812544d78610aef8cfc9f581c3d0c";
> export SSH_AGENT_PID=3D"1525"; export
> SSH_AUTH_SOCK=3D"/tmp/ssh-LRkwiDyVSVf5/agent.1479"; export
> PATH=3D"/home/sharihinds/CL-SOM-AM57x/morty/scripts/native-intercept:/hom=
e/sharihinds/CL-SOM-AM57x/morty/build/tmp/sysroots-uninative/x86_64-linux/u=
sr/bin:/home/sharihinds/CL-SOM-AM57x/morty/scripts:/home/sharihinds/CL-SOM-=
AM57x/morty/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux:/home/shar=
ihinds/CL-SOM-AM57x/morty/build/tmp/sysroots/x86_64-linux/usr/bin:/home/sha=
rihinds/CL-SOM-AM57x/morty/build/tmp/sysroots/x86_64-linux/usr/sbin:/home/s=
harihinds/CL-SOM-AM57x/morty/build/tmp/sysroots/x86_64-linux/usr/bin:/home/=
sharihinds/CL-SOM-AM57x/morty/build/tmp/sysroots/x86_64-linux/sbin:/home/sh=
arihinds/CL-SOM-AM57x/morty/build/tmp/sysroots/x86_64-linux/bin:/home/shari=
hinds/CL-SOM-AM57x/morty/scripts:/home/sharihinds/CL-SOM-AM57x/morty/bitbak=
e/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/gam=
es:/usr/local/games:/snap/bin";
> export HOME=3D"/home/sharihinds"; /usr/bin/env wget -t 2 -T 30 -nv
> --passive-ftp --no-check-certificate -P
> /home/sharihinds/CL-SOM-AM57x/downloads
> 'http://install.source.dir.local/CCS6.1.3.00034_linux.tar.gz' --progress=
=3Ddot
> -v failed with exit code 4, output:
> --2016-11-04 12:07:14--
> http://install.source.dir.local/CCS6.1.3.00034_linux.tar.gz
> Resolving install.source.dir.local (install.source.dir.local)... failed:
> Name or service not known.
> wget: unable to resolve host address =E2=80=98install.source.dir.local=E2=
=80=99
>
> ERROR: ti-ccsv6-native-6.1.3.00034-r0 do_fetch: Fetcher failure for URL:
> 'http://install.source.dir.local/CCS6.1.3.00034_linux.tar.gz;name=3Dccsv6=
'.
> Unable to fetch URL from any source.
> ERROR: ti-ccsv6-native-6.1.3.00034-r0 do_fetch: Function failed:
> base_do_fetch
> ERROR: Logfile of failure stored in:
> /home/sharihinds/CL-SOM-AM57x/morty/build/tmp/work/x86_64-linux/ti-ccsv6-=
native/6.1.3.00034-r0/temp/log.do_fetch.13158
> ERROR: Task
> (/home/sharihinds/CL-SOM-AM57x/morty/build/../meta-ti/recipes-ti/devtools=
/ti-ccsv6-native_6.1.3.00034.bb:do_fetch)
> failed with exit code '1'
>
> Error reveals when I add ipumm-fw in dependency of kernel.
>
> Does anybody encountered same problem? How can I fix this issue?

http://processors.wiki.ti.com/index.php/Processor_SDK_Building_The_SDK#Code=
_Composer_Studio

Regards

--=20
Robert Nelson
https://rcn-ee.com/

