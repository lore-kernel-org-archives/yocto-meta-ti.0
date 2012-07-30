Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13593E0027D
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 13:00:39 -0700 (PDT)
Received: (qmail 7335 invoked by uid 1003); 30 Jul 2012 20:00:39 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.160.48)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	30 Jul 2012 20:00:38 -0000
Message-ID: <5016E7E5.6050801@balister.org>
Date: Mon, 30 Jul 2012 16:00:37 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: joshua.marinacci@nokia.com
References: <9D64B6CF-0B94-413C-89A4-D9A55DB38AF1@nokia.com>
In-Reply-To: <9D64B6CF-0B94-413C-89A4-D9A55DB38AF1@nokia.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Gumstix Wifi
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
X-List-Received-Date: Mon, 30 Jul 2012 20:00:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2012 03:30 PM, joshua.marinacci@nokia.com wrote:
> Hi guys. After becoming very frustrated with Gumstix' prefab images I came to the  Yocto presentation at OSCON a week ago and was very impressed.  I've started building a distro for my Gumstix Overo but have ran into a few roadblocks that I'm hoping you can help with.

Remember the gumstix support here is done by community members, not 
gumstix engineering. Please remind the gumstix people on the gumstix 
list that it would be great if they could contribute some time to 
testing and fixing these problems :)

Philip

>
> First, I started with the latest Yocto, meta-gumstix and meta-ti from git and I can successfully compile and boot core-image-minimal.  Of course that doesn't have networking.
>
> Next, I tried running Hob to add networking packages.  Hob does not seem to work with meta-ti.  I can launch but when I add the meta-ti layer and choose a machine it fails with "ExpansionError during parsing %s:%s".  Of course it is not helpful in providing which file the parsing error was in. :)
>
> Next, I tried simply adding  wpa_supplicant to the image by adding this line to my local.conf and compiling from the command line.
>
> CORE_IMAGE_EXTRA_INSTALL += "wpa-supplicant"
>
>
> This does work. When I boot the wpa stuff is included but I still don't have a network driver loaded.  If I include the built modules-3.2.19-r0-overo.tgz in my rootfs I can cd into the directory with all of the modules.  However insmod libertas.ko fails with
>
> 	insmod: can't insert 'libertas_tf_usb.ko': unknown symbol in module, or unknown parameter
>
> and modprobe fails with
>
> 	modprobe: module libertas not found in modules.dep
>
>
> So, what should I do to make sure the libertas module is compiled correctly, included in my kernel, and then actually used at runtime?
>
> Thank you all for your help. I'm very excited about the Yocto project.
>
> - Josh
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

