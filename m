Return-Path: <mikelewis@alphalem.com>
Received: from outbound-ss-317.hostmonster.com
	(outbound-ss-317.hostmonster.com [74.220.220.191])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id B8DB1E016A3
	for <meta-ti@yoctoproject.org>; Tue,  8 Oct 2013 14:30:37 -0700 (PDT)
Received: (qmail 15196 invoked by uid 0); 8 Oct 2013 21:30:36 -0000
Received: from unknown (HELO box891.bluehost.com) (69.195.124.91)
	by oproxy13.mail.unifiedlayer.com with SMTP; 8 Oct 2013 21:30:36 -0000
Received: from [24.130.51.221] (port=40442 helo=[10.0.0.5])
	by box891.bluehost.com with esmtpsa (TLSv1:CAMELLIA256-SHA:256)
	(Exim 4.80) (envelope-from <mikelewis@alphalem.com>)
	id 1VTerU-0000bH-3e
	for meta-ti@yoctoproject.org; Tue, 08 Oct 2013 15:30:36 -0600
Message-ID: <5254797B.5020605@alphalem.com>
Date: Tue, 08 Oct 2013 14:30:35 -0700
From: Mike Lewis <mikelewis@alphalem.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
X-Identified-User: {2749:box891.bluehost.com:alphalem:alphalem.com}
	{sentby:smtp auth 24.130.51.221 authed with
	mikelewis+alphalem.com}
Subject: BeagleBone Black rootfs/boot dir empty
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
X-List-Received-Date: Tue, 08 Oct 2013 21:30:39 -0000
Content-Type: multipart/alternative;
	boundary="------------050204080108080805000903"

--------------050204080108080805000903
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to boot a poky-dylan core-image-basic image using meta-ti on 
my BBB and u-boot is complaining about two things (so far): missing 
boot/uImage and missing boot/am335x-boneblack.dtb. Here's the log:

http://pastebin.com/Aw4SzxxR

I copied uImage from partition 1 to partition 2/boot, so hopefully 
that's fine. But bitbake isn't producing the device tree file anywhere. 
Is there a fix for this somewhere or a recipe that I can modify to 
populate the partition 2 /boot dir?

Thanks,
Mike

-- 
Mike Lewis
CEO, Co-founder
Alphalem, Inc.


--------------050204080108080805000903
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi,<br>
    <br>
    I'm trying to boot a poky-dylan core-image-basic image using meta-ti
    on my BBB and u-boot is complaining about two things (so far):
    missing boot/uImage and missing boot/am335x-boneblack.dtb. Here's
    the log:<br>
    <br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <a href="http://pastebin.com/Aw4SzxxR">http://pastebin.com/Aw4SzxxR</a><br>
    <br>
    I copied uImage from partition 1 to partition 2/boot, so hopefully
    that's fine. But bitbake isn't producing the device tree file
    anywhere. Is there a fix for this somewhere or a recipe that I can
    modify to populate the partition 2 /boot dir?<br>
    <br>
    Thanks,<br>
    Mike<br>
    <pre class="moz-signature" cols="72">-- 
Mike Lewis
CEO, Co-founder
Alphalem, Inc.</pre>
  </body>
</html>

--------------050204080108080805000903--
