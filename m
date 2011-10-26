Return-Path: <jkridner@beagleboard.org>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F39CE005BB
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 23:44:56 -0700 (PDT)
Received: by gyh3 with SMTP id 3so1669405gyh.35
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 23:44:55 -0700 (PDT)
Received: by 10.150.196.13 with SMTP id t13mr27505600ybf.69.1319611495556;
	Tue, 25 Oct 2011 23:44:55 -0700 (PDT)
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by mx.google.com with ESMTPS id r9sm2508355anh.8.2011.10.25.23.44.54
	(version=SSLv3 cipher=OTHER); Tue, 25 Oct 2011 23:44:54 -0700 (PDT)
Received: by ywm14 with SMTP id 14so1675841ywm.35
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 23:44:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.146.159.14 with SMTP id h14mr1739265yae.4.1319611457018; Tue,
	25 Oct 2011 23:44:17 -0700 (PDT)
Received: by 10.147.136.2 with HTTP; Tue, 25 Oct 2011 23:44:16 -0700 (PDT)
In-Reply-To: <20111026053519.GA15391@denix.org>
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
	<20111026053519.GA15391@denix.org>
Date: Wed, 26 Oct 2011 02:44:16 -0400
Message-ID: <CA+T6QPmWEKLjZHV=tnQ+OMROc+s9h-TYy31ykoYHs6AzgPS3_A@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Wed, 26 Oct 2011 06:44:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 26, 2011 at 1:35 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Oct 25, 2011 at 07:13:14PM -0500, Joel A Fernandes wrote:
>> Enable the PL2303 usb-to-serial driver required for serial output
>> from the beaglebone tester.
>
> BTW, has anyone tried building kernel for am335x-evm lately? It appears broken
> for me with bunch of unresolved symbols for musb... Doing bisect doesn't help
> much, as the tree was rebased and no previous revs are available :(

The lack of previous revs cost me about 24 hours of trying to figure
out how to fix the repo and waiting for it to fetch, but I have only
been trying to build for the Bone, not for the EVM.  My builds are
currently failing on "lzop: command not found".

>
> --
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

