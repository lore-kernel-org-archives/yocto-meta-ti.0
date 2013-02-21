Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id B2C72E0070F
	for <meta-ti@yoctoproject.org>; Thu, 21 Feb 2013 05:27:00 -0800 (PST)
Received: from localhost ([127.0.0.1]:46768)
	by astoria.ccjclearline.com with esmtpa (Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>) id 1U8WAs-0007fE-Iy
	for meta-ti@yoctoproject.org; Thu, 21 Feb 2013 08:26:58 -0500
Received: from 65.160.229.33 ([65.160.229.33]) by crashcourse.ca (Horde
	Framework) with HTTP; Thu, 21 Feb 2013 08:26:58 -0500
Message-ID: <20130221082658.197731h2k17gpx8g@crashcourse.ca>
Date: Thu, 21 Feb 2013 08:26:58 -0500
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-ti@yoctoproject.org
References: <46F9BF9187AF5A4AA0AEF94A28ADD22488C678@sestoex09.enea.se>
	<512613C9.5040902@communistcode.co.uk>
	<51261426.1050809@communistcode.co.uk>
In-Reply-To: <51261426.1050809@communistcode.co.uk>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.11)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: LICENSE related errors while using meta-ti layer
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
X-List-Received-Date: Thu, 21 Feb 2013 13:27:00 -0000
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Quoting Jack Mitchell <ml@communistcode.co.uk>:

>> Take a look at the README in the meta-ti layer.
>>
>
> Apologies it seems the README has been changed. Some of these  
> recipes need to be masked in order to get them to build.

   i once tossed together a simple (probably dated by now) page for
getting started with meta-ti that mentions masking some of those
recipes because of license issues:

http://www.crashcourse.ca/wiki/index.php/Getting_started_with_meta-ti

i should probably update that page this weekend.

rday


